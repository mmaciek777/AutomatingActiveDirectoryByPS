Import-Module ActiveDirectory

$filepath = Read-Host -Prompt "Proszę podać ścieżkę importowanego pliku"

$users = Import-Csv $filepath

$securePassword = ConvertTo-SecureString 'zaq1@WSX' -AsPlainText -Force

ForEach ($user in $users){
    
    $fname = $user.'First Name'
    $lname = $user.'Last Name'
    $jtitle = $user.'Job Title'
    $officephone = $user.'Office Phone'
    $emailaddress = $user.'Email Address'
    $description = $user.Description
    $OUpath = $user.OU

    
    New-ADUser -Name "$fname $lname" -GivenName $fname -Surname $lname -UserPrincipalName "$fname.$lname" 
    -EmailAddress $emailaddress -Path $OUpath -AccountPassword $securePassword -ChangePasswordAtLogon $true -OfficePhone $officephone -Description $description -Enabled $true
    
    echo "Account created for $fname $lname in $OUpath"

}
