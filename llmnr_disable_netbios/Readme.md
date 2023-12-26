## LLMNR and Netbios
- What is LLMNR and NetBIOS
- Capture LLMNR request using Wireshark
- Create a GPO to disable LLMNR and another one to disable NetBIOS
#
#### LLMNR (Link-Local Multicast Name Resolution)
LLMNR is a protocol used to resolve the Domain Name System (DNS) names to IP addresses on local networks when DNS name resolution through conventional methods (like DNS servers) fails. LLMNR functions by sending out a multicast query to the local subnet to resolve the name to an IP address.
#### NetBIOS (Network Basic Input/Output System)
NetBIOS is an older protocol suite used in local area networks for communication between devices and services over the network. It provides services related to the session layer of the OSI model, allowing applications on separate computers to communicate over a local network. NetBIOS facilitates functions such as file sharing, printer sharing, and other communications between devices. It uses names called NetBIOS names to identify devices and services on a network.
#
#### Capture LLMNR request using Wireshark
we can capture LLMNR traffic throughput Access and shared files or any other machine on a network even if can't access this object, cuz the main purpose of LLMNR works like DNS, so it tries to resolve your path to get on IP as above definition <br>
So we open Wireshark, Access any path, and filter traffic for LLMNR 
<img src=https://github.com/0xDigimon/GBG-Security-Intern/blob/main/llmnr_disable_netbios/01.png><br>
#
#### Create a GPO to disable LLMNR and another one to disable NetBIOS
- Disable LLMNR Using GPO
open GPO on Domain Controller and follow these steps Computer Configuration -> Administrative Templates -> Network -> DNS Client. And Enable Turn Off Multicast Name Resolution policy by changing its value to Enabled
<img src=https://github.com/0xDigimon/GBG-Security-Intern/blob/main/llmnr_disable_netbios/02.png><br>
check LLMNR by Repeat previous steps you have to see
<img src=https://github.com/0xDigimon/GBG-Security-Intern/blob/main/llmnr_disable_netbios/03.png><br>
- Disable NetBIOS Using GPO
To disable NetBIOS you have to create Powershell Script and put it in Netlogon or any folder but you have to share this folder with all machines which you want to apply the policy<br> 
by using this script ```$regkey = "HKLM:SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces"
Get-ChildItem $regkey |foreach { Set-ItemProperty -Path "$regkey\$($_.pschildname)" -Name NetbiosOptions -Value 2 -Verbose}``` put it in disable_netbios.ps1 and put the script in ```netlogon``` folder <img src=https://github.com/0xDigimon/GBG-Security-Intern/blob/main/llmnr_disable_netbios/dis-netbios.png><br>
open GPO and follow steps Computer Configuration -> Policies -> Windows Settings -> Scripts -> Startup- > PowerShell Scripts then put your script in Startup
<img src=https://github.com/0xDigimon/GBG-Security-Intern/blob/main/llmnr_disable_netbios/04.png><br>
To check if NetBIOS disabled run this command in cmd ```ipconfig /all |find "NetBIOS"``` <img src=https://github.com/0xDigimon/GBG-Security-Intern/blob/main/llmnr_disable_netbios/06.png><br>
#
### Thanks For Reading
