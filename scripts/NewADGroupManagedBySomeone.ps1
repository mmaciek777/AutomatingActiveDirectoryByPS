$ManagedBy = Read-Host -Prompt "Podaj imię i nazwisko użytkownika odpowiedzialnego za grupę(np. Jan Kowalski)"
$DisplayName = Read-Host -Prompt "Podaj nazwę grupy"
$OU = Read-Host -Prompt "Podaj jednostkę organizacyjną, w której zostanie utworzona grupa(1 - Pracownicy,2 - Kierownictwo)"
$OUPathManaged = Get-ADUser -Identity $ManagedBy -Properties "DistinguishedName"


if ($OU -eq 1)
{
    $OUpath = 'OU=Pracownicy,DC=test,DC=local'
}
elseif($OU -eq 2)
{
    $OUpath = 'OU=Kierownictwo,DC=test,DC=local'
}

New-ADGroup -Path $OUpath -Name $DisplayName -GroupScope Global -GroupCategory Security -DisplayName $DisplayName -ManagedBy $OUPathManaged -SamAccountName $DisplayName