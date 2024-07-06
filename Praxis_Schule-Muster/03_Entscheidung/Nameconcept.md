# Namenskonzept

In einer Infrastruktur, sowohl Cloud wie auch on-premise, ist es sinnvoll, dass man ein einheitliches Namenskonzept pflegt.
In diesem Abschnitt definiere ich, wie Gewisse Namen aufgebaut werden. 
Darunter zählen Namen von:
- Usern
- Gruppen
- Server
- Firewall
- Netzwerk
- Ressourcen
- etc. 

## User
Bei den Usern wird der **userPrincipalName (UPN)** normal erstellt, dass heisst nach dem Schema 
`vorname.nachname@schulemuster.ch` 
Der SamAccountName wird anhand vom UPN abgeleitet und wird wie folgt aufgebaut: `vorname.nachname` 

## Gruppen
Für die Gruppen wird es mehrere geben. Wir unterscheiden hier von Klassengruppen, Lizenzgruppen und allgemeine Sicherheitsgruppen. 

### Klassengruppen
Die Klassengruppe wird anhand der vorhandenen Klassen erstellt. 
Die Einzelnen Kürzel werden mit einem `_` getrennt.
Im Schema wird dies wie folgt gemacht. 

Als erstes wird die Schulstufe einbezogen:

| Stufe                     | Kürzel |
| ------------------------- | ------ |
| Primarstufe               | PS     |
| Mittelstufe               | MS     |
| Oberstufe / Sekundarstufe | OS     |
Anschliessend kommt die Klassenbezeichnung der jeweiligen Stufe

| Klassenbezeichnung | Schulstufe | Beschreibung          |
| ------------------ | ---------- | --------------------- |
| 1a                 | PS         | 1. Klasse A           |
| 4a                 | MS         | 4. Klasse A           |
| A1a                | OS         | 1. Klasse Niveau A, A |
In allen drei Schulstufen, werden die Klassen gleich benannt. 
Bei allen Fällen ist die Zahl, die Klasse 1-6 PS und MS und 1-3 für die OS.
Der unterschied zwischen Primar und Sekundarstufe ist, dass ab der Sekundarstufe noch die Niveaus dazu kommen. Die Niveaus sind von A-C, welche vor das Klassenjahr gestellt werden. 

Zusammengestellt würden die Klassen wie folgt aufgestellt werden: 

| Gruppenname | Schulstufe |
| ----------- | ---------- |
| PS_1a       | PS         |
| MS_4a       | MS         |
| OS_A1a      | OS         |
| OS_B2a      | OS         |
Die Gruppen würden beim Schulwechsel angepasst werden. 

### Lizenzgruppen

Die Lizenzgruppen werden separat gemacht, damit man dies einfach verwalten kann. 
Pro Schulstufe gibt es eine eigene Lizenzgruppe, aus dem Grund, dass wir so die Lizenzen einfacher verwalten können. 
Auch wenn alle die gleiche Lizenz erhalten, werden pro Schulstufe einzelne Dienste deaktiviert. 
Folgende Gruppen werden erstellt:

`M365_A*_Lizenz_PS_SuS` -> Wichtig zu beachten ist, dass `*` als Platzhalter für die Education Lizenzversion ist. Bei der Educationlizenzen gibt es die Versionen A1, A3 und A5. 
Genaueres zur Lizenz wird im Licence Management erläutert. 
Des Weiteren wird die Schulstufe angegeben und anschliessend mit `SuS` beschrieben. Dies bedeutet, dass es sich um die Student-Lizenz handelt. 

Für die Faculty-Lizenzen (Lehrpersonenlizenzen), wird eine einzige Gruppe erstellt, welche über alle Schulstufen gilt. 
Die Gruppe wird in etwa dem gleichen Prinzip erstellt:
`M365_A*_Lizenz_LP` -> Das `LP` steht für die Lehrpersonen und das `A*` steht wie auch bei den Schülern für die Lizenzversion (A1, A3 & A5). 

### Sicherheitsgruppen

Unter den Sicherheitsgruppen gibt es diverse Gruppen, welche erstellt werden, um beispielsweise Rollenbasierte Zugriffskontrolle zu vergeben (RBAC), E-Mailverteiler (MailEnabledSecurityGroup), SharePoint-Gruppen oder auch für den Bedingten Zugriff und den Passwort Reset. 

Folgende Sicherheitsgruppen werden erstellt:

| Gruppenbezeichnung | Gruppe für Bereich       | Zweck                                                                                                                           |
| ------------------ | ------------------------ | ------------------------------------------------------------------------------------------------------------------------------- |
| SPO_*              | SharePoint-Gruppe        | Gruppe für Zugriff aus SharePoint. Beginnt mit `SPO_` und anschliessend folgt ein Logischer Gruppenname, beispielsweise.        |
| PWREset            | Securitygroup            | Gruppe für PAsswortrichtlinie, damit Benutzer ihr eigenes Passwort zurücksetzen können.                                         |
| MFA_Users          | Securitygroup            | Gruppe für Multifaktorauthentifizierung der Benutzer                                                                            |
| MFA_Admins         | Securitygroup            | Gruppe für Multifaktorauthentifizierung der Admins                                                                              |
| PWReset_Admins     | Securitygroup            | Gruppe für Benutzer, welche Passwörter anderer Benutzer ändern dürfen. RBAC-Zuweisung einer Rolle                               |
| Alle_*             | MailEnabledSecurityGroup | Mailverteiler, welcher auf einer Sicherheitsgruppe basiert und allen Benutzer anhand der Beschreibung(`*`) die E-Mails zusendet |

## Azure Ressourcen
Da wir in der Cloud (Azure) diverse Ressourcen verwenden, gibt es dazu auch ein Namenskonzept. 
Im Azure haben wir einige Dienste, hier gilt ein zentrales Namenskonzept, welches aus der nachfolgenden Tabelle entnommen werden kann:


| Bezeichnung          | Ressourcentyp      | Beschreibung                                                                                                                                                                                                                        |
| -------------------- | ------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| az-rg-sm-`*`-`+`     | Ressource Group    | `az` = **Az**ure<br>`rg` = **R**essource **G**roup<br>`sm` = **S**chule **M**uster<br>`*` = Abteilungsname (Bsp.: IT oder Server, Verwaltung, etc.)<br>`+` = App/Service welcher die Ressource Group enthält (Bsp. Homepage)        |
| az-vNet-sm-`**`      | Virtual Network    | `az` = **Az**ure<br>`vNet` = **V**irtual **Net**work<br>`sm` = **S**chule **M**uster<br>`**` = Netzbezeichnung (Bsp.: Client, Server, etc.)                                                                                         |
| az-pbIP-sm-`***`     | Public IP          | `az` = **Az**ure<br>`pbIP` = **P**u**b**lic **IP** <br>`sm` = **S**chule **M**uster<br>`***` = Beschreibung des zwecks (Homepage, Loadbalancer, etc)                                                                                |
| az-`****`-sm-1       | Ressourcen         | `az` = **Az**ure<br>`****` = Kürzel für Ressource (Bsp.: Firewall = FW, Loadbalancer = LB, etc. )<br>`sm` = **S**chule **M**uster                                                                                                   |
| az-vm-sm-`*****`-1   | Virtuelle Maschine | `az` = **Az**ure<br>`vm` = Virtuelle Maschine`<br>`sm` = **S**chule **M**uster`<br>`*****` = Abteilungsname (Bsp.: IT oder Server, Verwaltung, etc.)<br>`1` = Fortlaufende Nummerierung                                             |
| az-srv-sm-`******`-1 | Server             | `az` = **Az**ure<br>`srv` = Virtuelle Maschine`<br>`sm` = **S**chule **M**uster`<br>`******` = Art des Servers (Bsp.: DC = Domain Controler, SQL = SQL-Datenbank-Server, Web = Webserver, etc. )<br>`1` = Fortlaufende Nummerierung |
|                      |                    |                                                                                                                                                                                                                                     |

