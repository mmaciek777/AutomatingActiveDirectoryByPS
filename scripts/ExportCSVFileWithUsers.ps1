$users = Get-ADObject -Filter {objectClass -eq "user"} -Properties "Name","DistinguishedName","SamAccountName"

$users | Export-Csv C:\uzytkownicy.csv