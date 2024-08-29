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

$D1 = "R2V0LUN1bHR1cmU="  
$E1 = "TmFtZQ=="          

$F1 = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($D1))
$G1 = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($E1))
$H1 = Invoke-Expression $F1
$I1 = $H1 | Select-Object -ExpandProperty $G1
$J1 = "cnUtUlUgdWstVUEgYnktQlkgZW4tSU4=" 
$K1 = ([System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($J1))).Split(" ")
$L1 = Get-Random
$M1 = "V" + $L1
$N1 = "H" + (Get-Random)
if ($K1 -contains $I1) {
    $O1 = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("Q3VsdHVyZSBjaGVjayBwYXNzZWQuIEN1cnJlbnQgY3VsdHVyZTog")) + $I1
    Invoke-Expression ([string]::Format("{0} '{1}'", "Write-Host", $O1))
} else {
    $P1 = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("Tm9uLWV4Y2x1ZGVkIGN1bHR1cmUgZGV0ZWN0ZWQuIFByb2NlZWRpbmcgd2l0aCBvcGVyYXRpb24u"))
    Invoke-Expression ([string]::Format("{0} '{1}'", "Write-Host", $P1))
}