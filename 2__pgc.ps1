# Function for XOR encryption and decryption
function G0 {
    param (
        [string]$A1,
        [int]$A2
    )
    $B1 = ""
    foreach ($C1 in $A1.ToCharArray()) {
        $B1 += [char]([byte][char]$C1 -bxor $A2)
    }
    return $B1
}

# XOR and Base64 obfuscation for cmdlet names and strings
$D1 = "R2V0LUN1bHR1cmU="  # Encoded 'Get-Culture' in Base64
$E1 = "TmFtZQ=="          # Encoded 'Name' in Base64

# Decode the Base64 strings directly without XOR encryption to avoid corruption
$F1 = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($D1))
$G1 = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($E1))

# Dynamic execution to avoid direct cmdlet call
$H1 = Invoke-Expression $F1

# Extract property using dynamic invocation and obfuscated variables
$I1 = $H1 | Select-Object -ExpandProperty $G1

# Further obfuscate the exclusion list using correct Base64
$J1 = "cnUtUlUgdWstVUEgYnktQlkgZW4tSU4="  # Encoded 'ru-RU uk-UA by-BY en-IN' in Base64

# Decode exclusion list and convert to an array
$K1 = ([System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($J1))).Split(" ")

# Create random variables to obscure logic
$L1 = Get-Random
$M1 = "V" + $L1
$N1 = "H" + (Get-Random)

# Use obfuscated check for exclusion
if ($K1 -contains $I1) {
    # Generate and dynamically log message
    $O1 = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("Q3VsdHVyZSBjaGVjayBwYXNzZWQuIEN1cnJlbnQgY3VsdHVyZTog")) + $I1
    Invoke-Expression ([string]::Format("{0} '{1}'", "Write-Host", $O1))
} else {
    # Generate a different log message dynamically
    $P1 = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("Tm9uLWV4Y2x1ZGVkIGN1bHR1cmUgZGV0ZWN0ZWQuIFByb2NlZWRpbmcgd2l0aCBvcGVyYXRpb24u"))
    Invoke-Expression ([string]::Format("{0} '{1}'", "Write-Host", $P1))
}