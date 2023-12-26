## LLMNR and Netbios
- What is LLMNR and NetBIOS
- Capture LLMNR request using Wireshark
- Create a GPO to disable  LLMNR and another one to disable NetBIOS
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

