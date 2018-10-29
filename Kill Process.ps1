#Gets all workstations that need to have software installed, if you don't want to uninstall all of the software from you will need to use a text document and Get-Content
$Machines = Get-ADComputer -Filter * -SearchBase "OU=Workstations,DC=Contoso,DC=COM" | Select DNSHostName -ExpandProperty DNSHostname

#Name of Application To Kill
$Application = "Notepad"

#For Each Loop to Kill Process On Each Computer

foreach ($Machine in $Machines)
{
(Get-WmiObject Win32_Process -ComputerName $Machine | ?{ $_.ProcessName -match "$Application" }).Terminate()
}
