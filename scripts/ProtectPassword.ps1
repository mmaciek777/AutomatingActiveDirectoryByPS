$MaxPasswordAge = 90
$MinPasswordLength = 12
$PasswordComplexity = $True

Get-ADUser -Filter * | ForEach-Object {
    Set-ADAccountPasswordPolicy -Identity $_.DistinguishedName -MaxPasswordAge $MaxPasswordAge

    Set-ADUser -Identity $_.DistinguishedName -MinPasswordLength $MinPasswordLength

    Set-ADUser -Identity $_.DistinguishedName -PasswordNeverExpires $False
    Set-ADUser -Identity $_.DistinguishedName -PasswordPolicyEnabled $PasswordComplexity
}
