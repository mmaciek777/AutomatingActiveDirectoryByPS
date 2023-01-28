$created = Get-ADObject "ou=Pracownicy,dc=test,dc=local" -Properties whenCreated

$created.whenCreated

