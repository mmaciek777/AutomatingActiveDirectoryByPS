Search-ADAccount -AccountInactive -TimeSpan 90.00:00:00 | where {$_.ObjectClass -eq 'user'} | Disable-ADAccount
