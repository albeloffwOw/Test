#include <windows.h>

// Exported function to open Notepad
__declspec(dllexport) void OpenNotepad()
{
    // Use the WinAPI function ShellExecute to open Notepad
    ShellExecute(NULL, "open", "notepad.exe", NULL, NULL, SW_SHOWNORMAL);
}

// Entry point for the DLL
BOOL APIENTRY DllMain(HMODULE hModule, DWORD ul_reason_for_call, LPVOID lpReserved)
{
    switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH:
    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
        break;
    }
    return TRUE;
}
