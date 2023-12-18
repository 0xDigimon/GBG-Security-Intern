Get-Command -Noun service
Get-Help Get-Service
Get-Service | ?{$_.Status -eq "Stopped"}
Get-Service | ?{$_.Name.StartsWith("A")}
Get-Service | ?{$_.StartType -eq "Automatic" }
Get-Service | ?{$_.Status -eq "Running"} | Export-Csv "C:\Users\administrator\Desktop\Running.csv"
for ($i = 0;$i -lt 20 ; $i++) {
    $hash = '#' * $i
    Write-Host "$($hash)"
}