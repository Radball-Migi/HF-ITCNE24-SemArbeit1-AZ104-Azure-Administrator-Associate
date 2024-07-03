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
Auch wenn alle die gleiche Lizenz erhalten, werden pro Schulstufe die Dienste 
