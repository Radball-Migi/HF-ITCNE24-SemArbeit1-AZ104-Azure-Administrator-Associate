# Empfehlung

Meine Empfehlung von diesem Projekt ist durchaus das eingeplante Szenario.

Wenn wir andere Schulen zum vergleich nehmen, arbeiten bereits die meisten mit einer hybriden Umgebung. 
Begonnen beim Identity Management. 
Alle, welche die M365 Education Lizenzen verwenden, brauchen ein Entra ID. Damit dies mit dem AD on-prem zusammen arbeiten kann, muss man hier zu nur den Entra ID Connect installieren und man hat bereits eine hybride Umgebung. 
Zusätzlich versuchen wir die Tenants so gut wie möglich abzu sichern, weshalb wir mit dem Security Banchmark von Microsoft versuchen, immer auf dem neuesten Stand zu bleiben. 

Was vor allem für die Schulen Neuland ist, sind die Dienste im Azure wie die VMs, Loadbalancers, Speichermöglichkeiten, etc.

Vor allem der Speicherpart, ist für Schulen eher fremd, da sie den SharePoint und ihre OneDrives haben. 
Wenn man nun von heute auf morgen sagt, SharePoint wird mit Azure Storage ersetzt, würde aus meiner Sicht ein Chaos entstehen. 

Was bestimmt Sinn macht, ist das Hosting der Homepage und anderen Webpages nach Azure zu eskalieren. 
Mithilfe von Containering, Loadbalancing und Autoscaler, kann man eine gute Erreichbarkeit der Websites garantieren, ohne dass man die Hardware, Firewall, etc. bei sich intern betreuen muss. 
Dies nimmt der Schule Arbeit ab und eine Person, welche das betreut hat, kann sich damit auch in der Cloud befassen und die restliche Zeit für andere Projekte oder Tasks verwenden. 

Die Desktopablösung ist auch ein Vorteil, weil nun die Mitarbeitenden flexibler arbeiten können. 
In dem Sie den Notebook nachhause nehmen können, sei es das Kind ist krank, einem ist unwohl oder auch die Handwerker müssen vorbeikommen, kann man problemlos von Zuhause aus arbeiten und via Virtual Desktops hat man zugriff auf die Dateien von seinem Bereich. 
Da die Daten nur noch mit mühe von der VDI kopiert oder verschoben werden können, können wir so eine Datensicherheit garantieren, dass die Daten nur "Intern" abrufbar sind. 

Um das ganze kurz zu Fassen, Ja, ich würde dies so empfehlen, als Grundkonstrukt, welches man zukünftig ausbauen kann. 

<br>
> [⌂ **Zurück zur Projekthauptseite**](../README.md)


