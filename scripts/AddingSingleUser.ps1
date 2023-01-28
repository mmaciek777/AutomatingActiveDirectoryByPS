Import-Module ActiveDirectory

$firstname = Read-Host -Prompt "Podaj imię"
$lastname = Read-Host -Prompt "Podaj nazwisko"
$OU = Read-Host -Prompt "Podaj jednostkę organizacyjną(1 - Pracownicy,2 - Kierownictwo)"


if ($OU -eq 1)
{
    $OUpath = 'OU=Pracownicy,DC=test,DC=local'
}
elseif($OU -eq 2)
{
    $OUpath = 'OU=Kierownictwo,DC=test,DC=local'
}
 

$OnOrOff = Read-Host -Prompt "Czy konto ma być uruchomione?(0 - Wyłączone, 1 - Włączone)"
$ToInteger = [int]$OnOrOff
$substringFirstname = $firstname.Substring(0,1).ToLower() 
$substringLastname = $lastname.ToLower() 

New-ADUser `
    -Name "$firstname $lastname"`
    -Surname $lastname `
    -GivenName $firstname `
    -UserPrincipalName "$substringFirstname.$substringLastname"`
    -AccountPassword (ConvertTo-SecureString 'zaq1@WSX' -AsPlainText -Force) `
    -ChangePasswordAtLogon 1 `
    -Path $OUpath `
    -Enabled $ToInteger `
    -City "Katowice" `
    -AccountExpirationDate "05/12/2024" `




