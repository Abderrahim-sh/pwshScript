$ip = Read-Host -Prompt "Ip address"
$Prefix = Read-Host -Prompt "mask lenght : "
$gateway = Read-Host -Prompt "gateway : "
$Name =Read-Host -Prompt "Computer Name :"
Get-NetIPInterface | ft ifindex,AddressFamily,InterfaceAlias
$index=Read-Host -Prompt "Interface index :"
$dns= Read-Host -Prompt "Dns server : "

Rename-Computer -NewName $Name
Set-NetFirewallProfile -Profile * -Enabled $false
New-NetIPAddress -IPAddress $ip -DefaultGateway $gateway -PrefixLength $Prefix -InterfaceIndex $index
Set-DnsClientServerAddress -ServerAddresses $dns -InterfaceIndex $index
Restart-computer 