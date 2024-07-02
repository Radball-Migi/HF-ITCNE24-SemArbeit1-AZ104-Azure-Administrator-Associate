# Identity Management (Entra ID)

Im Identity Management werden alle Benutzer, Gruppen und Zugänge zu allen Microsoftdiensten gesteuert. 
In Microsoft übernimmt dies das Entra Identitiy (Entra ID, ehemals Azure AD). 
Nachfolgend wird eine Realisierung des Identity Management beschrieben:
## Einrichtung Hybridschnittstelle

Da die Schule Muster bis jetzt nur ein lokales AD hatte, wird neu eine Hybridschnittstelle eingerichtet mit dem Entra ID Connect, welcher die Daten zwischen dem AD und dem Entra ID synchronisiert. Damit dies möglich ist, muss einerseits der Entra ID Connect auf einem Server installiert werden, welcher auf das AD zugriff hat. Anschliessend werden die zu synchronisierenden Organisation Units (OU), Attribute welcher der Connect synchronisieren soll und der Passwort Hashsync konfiguriert. 
Mit diesen wenigen Schritten ist bereits die Hybridstelle für die Benutzerverwaltung erstellt. 


## Benutzerverwaltung

Die Benutzerverwaltung wird primär über das Active Directory (AD) gemacht. Da wir eine Hybridstelle konfiguriert haben, hat das AD die Hoheit über die Benutzer. 
Wichtig zu beachten ist, dass dies nur für Synchronisierte Benutzer betrifft. 

### Benutzererstellung 

Da eine Hybridschnittstelle eingerichtet ist, empfiehlt es sich, dass die Benutzer weiterhin im AD erstellt werden. 

Wir haben dafür eine Eigenentwickelte Applikation dafür: 

Der **ISE IntranetAdmin** ist eine User Lifecycle Applikation für die automatisierte Synchronisation von Benutzerkonten, Gruppen, Gruppenmitgliedschaften und der Zuteilung benötigter Ressourcen und Berechtigungen on-premise und in der Microsoft 365 Cloud. Das Tool bietet eine professionelle und flexible Automatisierung des Benutzermanagements – von der Erstellung über die Aktualisierung bis hin zur Archivierung oder endgültigen Löschung von Accounts und Ressourcen.

#### Vorteile des IntranetAdmin

- Import von personenbezogenen Daten aus verschiedenen Datenquellen wie CMI LehrerOffice, Escada, Escola, Djooze, EcoOpen, CSV-Dateien und SharePoint-Listen.
  
- Verwaltung von Accounts und Gruppen im Active Directory oder in der Microsoft 365 Cloud.
  
- Erstellung von persönlichen Ressourcen wie Home-Laufwerk, Profil- oder Gruppenlaufwerke und Mailpostfächern.
  
- Zuweisung zu Klassen oder Kursen in Microsoft Teams.
  
- Erstellung, Verwaltung, Archivierung und Löschung von Klassen und Kursen in Microsoft Teams.
  
- Generierung von persönlichen Loginblättern bzw. Gruppenlisten.
  
- Export der Daten für den Import in LehrerOffice, Apple School Manager oder LMVZ.
  
- Erstellung von Loginblätter

Mit dieser Applikation können wir gleich mit einem Schlag, die Zeit und Aufwände der Benutzererstellung reduzieren, da dies voll automatisch im Hintergrund läuft. 
Täglich gibt es Logs und ein ChangeReport, in dem man getätigte Änderungen einsehen kann und allfällige Fehler gleich erkennen kann. 

Ein genaues Konzept und vorgehen kann nach einer Analyse und Vorbesprechung ausgearbeitet werden. 

### Namenskonzeption

Das Namenskonzept würde wie folgt aufgebaut werden: 
#### UserPrincipalName (UPN)

| Funktion      | UPN                              |     |
| ------------- | -------------------------------- | --- |
| Lehrpersonen  | vorname.nachname@schulemuster.ch |     |
| Mitarbeitende | vorname.nachname@schulemuster.ch |     |
| Lernende      | vorname.nachname@schulemuster.ch |     |

##### Regeln für die Erstellung des UPNs

Neue Benutzer haben noch keinen userPrincipalName. Dieser wird durch den Sync generiert. Die Regeln, um Spezialfälle abzufangen, sind standardmässig so definiert:

- Wenn derselbe Vor- und Nachname mehrmals vorkommt, wird nach dem Namen automatisch eine Zahl in aufsteigender Folge gebildet (also z.B. vorname.name2@schulemuster.ch).

- Bei langen Vor- oder Nachnamen bzw. bei Verwendung von Doppelnamen wird folgende Regel in der auf-geführten Reihenfolge zur Bildung des UPN angewandt:

	- Alle Zeichen werden klein geschrieben (Max > max)

	- Sonderzeichen werden entfernt (peter? > peter)

	- Umlaute werden ersetzt (ö > oe)

	- Buchstaben ausserhalb der gängigen ASCII-Tabelle werden durch übliche Zeichen ersetzt (beispielsweise è durch e)

	- Doppelspaces werden mehrfach durch Space ersetzt (hans   peter > hans peter)

	- Wörter werden beidseits getrimmt ( max  > max)

	- Abstände nach führenden Präpositionen in Nachnamen werden entfernt (da costa -> dacosta)

- Es dürfen nie 2 identische UPN vorkommen, und die Logins müssen eine gültige E-Mail-Adresse repräsentieren (Regular-Expression Prüfung).



  





