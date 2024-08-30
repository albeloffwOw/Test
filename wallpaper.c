#include <windows.h>

// Entry point for the DLL
BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpReserved) {
    if (fdwReason == DLL_PROCESS_ATTACH) {
        // Change the wallpaper when the DLL is loaded
        SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, "C:\\temp\\sample.jpg", SPIF_UPDATEINIFILE | SPIF_SENDCHANGE);
    }
    return TRUE;
}