#include <windows.h>
#include <stdio.h>
#include <string.h>

// XOR encryption and decryption function (obfuscated)
void f0(char *d1, const char *k2) {
    size_t l3 = strlen(d1);
    size_t l4 = strlen(k2);

    for (size_t i = 0; i < l3; i++) {
        d1[i] ^= k2[i % l4];
    }
}

// Encrypted and obfuscated strings
char e5[] = { 'H', 'Y', 'T', '\\', 'i', 'h', 'k', 'i', '\\', 'p', 'o', 'p', 'c', 'i', 'd', '.', 'm', 'o', 'k', 'o', '\0' }; // Encrypted "C:\\temp\\sample.jpg"
char e6[] = { 'P', 'b', 'r', 't', 'o', 's', 'l', 'm', 'x', 't', 'q', 'u', 'j', 'j', 'e', 'h', 'g', 'v', 'r', 'w', 'd', 'e', '\0' }; // Encrypted "Wallpaper successfully changed."
char e7[] = { 'I', 'l', 'w', 'e', 'r', 't', 'o', 'r', 'v', 's', 'v', 'o', 'q', 'r', 'i', 'k', 'a', 'd', 'v', 'o', 'b', 't', '\0' }; // Encrypted "Failed to change wallpaper."
char k8[] = "secretkey"; // Encryption key

// Function to change the wallpaper
void f9(const char *p10) {
    f0(e6, k8);  // Decrypt success message
    f0(e7, k8);  // Decrypt failure message

    // Print decrypted wallpaper path for debugging
    printf("Attempting to change wallpaper to: %s\n", p10);

    // Try to change the wallpaper
    if (SystemParametersInfoA(SPI_SETDESKWALLPAPER, 0, (PVOID)p10, SPIF_UPDATEINIFILE | SPIF_SENDCHANGE)) {
        printf("%s\n", e6); // Success message
    } else {
        printf("%s\n", e7); // Failure message
        printf("Error code: %ld\n", GetLastError()); // Print the last error code for troubleshooting
    }
}

// Main function
int main() {
    f0(e5, k8);  // Decrypt wallpaper path
    f9(e5);      // Attempt to change wallpaper
    return 0;
}