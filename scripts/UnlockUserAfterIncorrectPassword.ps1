$username = Read-Host -Prompt "Podaj login uzytkownika do odblokowania"

Unlock-ADAccount -Identity $username