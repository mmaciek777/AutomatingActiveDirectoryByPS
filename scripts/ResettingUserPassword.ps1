$name = Read-Host -Prompt "Podaj imie i nazwisko użytkownika"
$Password = Read-Host -Prompt "Podaj nowe hasło użytkownika"
$Pass = ConvertTo-SecureString $Password -AsPlainText -Force

Set-ADAccountPassword -Identity $name -NewPassword $Pass -Reset
Set-ADUser -Identity $name -ChangePasswordAtLogon $true