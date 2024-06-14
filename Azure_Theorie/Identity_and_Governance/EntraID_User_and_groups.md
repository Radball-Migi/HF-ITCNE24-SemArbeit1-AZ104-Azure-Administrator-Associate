# Entra ID Benutzer- und Gruppenkonten

Um auf Azure-Ressourcen zuzugreifen, ist ein Azure-Benutzerkonto erforderlich. Dieses Konto enthält alle notwendigen Informationen zur Benutzerauthentifizierung. Es gibt drei Arten von Benutzerkonten, die von Microsoft Entra ID unterstützt werden. Diese Kategorien basieren auf dem Standort der Benutzerdefinition (Cloud oder OnPrem) und ob der Benutzer intern oder extern zur Microsoft Entra-Organisation gehört. 

## Benutzer
### Benutzerkontoarten

In der folgenden Tabelle werden die in Microsoft Entra ID unterstützten Benutzerkonten beschrieben.

| Benutzerkonto                            | Beschreibung                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Cloud-Identität**                      | Ein Benutzerkonto mit einer **Cloudidentität** ist ausschließlich in Microsoft Entra ID definiert. Es umfasst Administratorkonten und Benutzer, die innerhalb Ihrer Organisation verwaltet werden. Diese Identität kann sowohl für Benutzerkonten innerhalb Ihrer eigenen Microsoft Entra-Organisation als auch für Konten in einer externen Microsoft Entra-Instanz gelten. Wird eine Cloudidentität aus dem Hauptverzeichnis entfernt, so wird das zugehörige Benutzerkonto gelöscht. |
| **Verzeichnissynchronisierte Identität** | Benutzerkonten mit einer **verzeichnissynchronisierten Identität** sind ursprünglich in einem lokalen Active Directory definiert. Durch eine Synchronisierungsaktion mittels Microsoft Entra Connect werden diese Konten in Azure übertragen. Die Ursprungsquelle dieser Konten ist das Windows Server Active Directory.                                                                                                                                                                |
| **Gastbenutzer**                         | **Gastbenutzerkonten** sind Konten, die außerhalb von Azure definiert werden. Sie können Benutzerkonten von anderen Cloudanbietern oder Microsoft-Konten, wie beispielsweise ein Xbox LIVE-Konto, umfassen. Die Quelle für diese Konten ist der jeweils eingeladene Benutzer. Diese Art von Konten ist besonders nützlich, wenn externe Dienstleister oder Auftragnehmer Zugang zu Ihren Azure-Ressourcen benötigen.                                                                    |

### Was muss bei der Auswahl beachtet werden

- **Benutzerlokalisierung**
  Den Standort der Benutzer identifizieren, ob sie innerhalb oder außerhalb der Organisation sind. Es ist üblich, verschiedene Arten von Konten zu haben.
    
- **Einbeziehung externer Mitarbeiter**
  Überlegen wir, ob wir Personen ausserhalb der Organisation Zugriff auf unsere Ressourcen gewähren möchten. Dies kann durch die Verwendung von Gastkonten erreicht werden, die entfernt werden können, wenn sie nicht mehr benötigt werden.
    
- **Vielfältige Benutzerkonten**
  Verschiedene Arten von Benutzerkonten nutzen, um die Anforderungen des Unternehmens zu erfüllen. Dies kann die Verwendung von synchronisierten Identitätskonten und Cloud-Identitäten beinhalten.

### Benutzerkonten Verwalten

Es gibt mehrere Möglichkeiten, Cloud-Identitätsbenutzerkonten in Microsoft Entra ID hinzuzufügen. Ein gängiger Ansatz ist die Verwendung des Azure-Portals. Benutzerkonten können Microsoft Entra ID auch über das Microsoft 365 Admin Center, die Microsoft Intune-Verwaltungskonsole und die Azure CLI hinzugefügt werden.

#### Cloud-Identitätskonten

Der Administrator kann einen Benutzer innerhalb der Organisation erstellen oder einen Gastbenutzer einladen , um Zugriff auf Organisationsressourcen zu gewähren.

##### Wissenswertes bei der Erstellung der Konten:

- Ein neues Benutzerkonto muss einen Anzeigenamen und einen zugehörigen Benutzerkontonamen haben.
- Informationen und Einstellungen, die einen Benutzer beschreiben, werden im Benutzerkontoprofil gespeichert.
    
- Das Profil kann weitere Einstellungen wie die Berufsbezeichnung eines Benutzers und seine Kontakt-E-Mail-Adresse enthalten.
    
- Ein Benutzer mit globalen Administrator- oder Benutzeradministratorberechtigungen kann Profildaten in Benutzerkonten voreinstellen, beispielsweise die Haupttelefonnummer des Unternehmens.
    
- Benutzer ohne Administratorrechte können einige ihrer eigenen Profildaten festlegen, aber ihren Anzeigenamen oder Kontonamen nicht ändern.

##### Wichtig zu beachten

Beim Verwalten von Benutzerkonten sind mehrere Punkte zu beachten. 

- **Berücksichtigen der Benutzerprofildaten**
  Benutzer haben die Möglichkeit, ihre Profilinformationen nach Bedarf anzupassen. Dazu gehören optionale Details wie Bild, Beruf und Kontaktinformationen. Zusätzlich können individuelle Profileinstellungen basierend auf den spezifischen Anforderungen einer Organisation bereitgestellt werden.
    
- **Erwägen der Wiederherstellungsoptionen für gelöschte Konten** 
  Im Kontoverwaltungsplan sollten Szenarien für die Wiederherstellung von Konten berücksichtigt werden. Gelöschte Konten können bis zu 30 Tage nach derer Löschung wiederhergestellt werden. Nach diesem Zeitraum ist eine Wiederherstellung nicht mehr möglich.
    
- **Berücksichtigen der gesammelten Kontodaten**
  Es ist wichtig, Anmelde- und Überwachungsprotokolle für Benutzerkonten zu sammeln. Mit geeigneten Tools, wie zum Beispiel Microsoft Entra ID, können diese Daten zur Analyse und Verbesserung der Infrastruktur genutzt werden.

### Massenerstellung von Benutzerkonten

Microsoft Entra ID unterstützt mehrere Massenvorgänge, darunter das Massenerstellen und -löschen von Benutzerkonten. Der gängigste Ansatz für diese Vorgänge ist die Verwendung des Azure-Portals. Azure PowerShell kann zum Massenupload von Benutzerkonten verwendet werden.

#### Merkmale zur Massenerstellung von Benutzern

- Nur globale Administratoren oder Benutzeradministratoren verfügen über die Berechtigung zum Erstellen und Löschen von Benutzerkonten im Azure-Portal.
    
- Um Massenerstellungs- oder -löschvorgänge abzuschließen, füllt der Administrator eine CSV-Vorlage (Comma-Separated Values) mit den Daten für die Benutzerkonten aus.
    
- Vorlagen für Massenvorgänge können vom Microsoft Entra Admin Center heruntergeladen werden.
    
- Massenlisten von Benutzerkonten können heruntergeladen werden.

#### Was muss beachtet werden?

Hier sind einige Designüberlegungen zum Erstellen und Löschen von Benutzerkonten.

- **Beachten der Namenskonventionen**
  Legen Sie eine Namenskonvention für Ihre Benutzerkonten fest oder implementieren Sie eine solche. Wenden Sie Konventionen auf Benutzerkontennamen, Anzeigenamen und Benutzeraliase an, um unternehmensweit Einheitlichkeit zu gewährleisten. Konventionen für Namen und Aliase können den Massenerstellungsprozess vereinfachen, indem sie die Anzahl der eindeutigen Bereiche in der CSV-Datei reduzieren. Eine Konvention für Benutzernamen könnte mit dem Nachnamen des Benutzers beginnen, gefolgt von einem Punkt, und mit dem Vornamen des Benutzers enden, wie in Sawyer-Miller.Aran@contoso.com.
    
- **Erwägen der Verwendung von Initialpasswörtern**
  Implementieren Sie eine Konvention für das Initialpasswort eines neu erstellten Benutzers. Entwickeln Sie ein System, um neuen Benutzern ihre Passwörter auf sichere Weise mitzuteilen. Sie können ein zufälliges Passwort generieren und es per E-Mail an den neuen Benutzer oder dessen Manager senden.
    
- **Überlegungen der Strategien zur Minimierung von Fehlern**
  Zeigen Sie alle Fehler an und beheben Sie sie, indem Sie die Ergebnisdatei auf der Seite  „Ergebnisse des Massenvorgangs“ im Azure-Portal herunterladen. Die Ergebnisdatei enthält den Grund für jeden Fehler. Ein Fehler kann ein bereits erstelltes Benutzerkonto oder ein doppelt vorhandenes Konto sein. Im Allgemeinen ist es einfacher, kleinere Gruppen von Benutzerkonten hochzuladen und Probleme zu beheben.


## Gruppen

Mit Microsoft Entra ID kann in der Organisation **zwei Arten von Gruppenkonten** erstellen:

1. **Sicherheitsgruppen**: Diese werden genutzt, um den Zugriff von Mitgliedern und Computern auf freigegebene Ressourcen zu verwalten. Sie können eine Sicherheitsgruppe für eine spezifische Sicherheitsrichtlinie erstellen und allen Mitgliedern der Gruppe dieselben Berechtigungen zuweisen.
    
2. **Microsoft 365-Gruppen**: Diese bieten Möglichkeiten zur Zusammenarbeit. Mitglieder dieser Gruppen haben Zugriff auf ein freigegebenes Postfach, einen Kalender, Dateien, eine SharePoint-Site und mehr.
    

Zusammengefasst ermöglicht Microsoft Entra ID der Organisation, sowohl den Zugriff auf Ressourcen zu verwalten als auch die Zusammenarbeit zu fördern.

##### Wissenswertes beim erstellen von Gruppen

- Verwenden Sie Sicherheitsgruppen, um Berechtigungen für alle Gruppenmitglieder gleichzeitig festzulegen, anstatt jedem Mitglied einzeln Berechtigungen zu erteilen.
    
- Fügen Sie Microsoft 365-Gruppen hinzu, um Gastbenutzern außerhalb Ihrer Microsoft Entra-Organisation den Gruppenzugriff zu ermöglichen.
    
- Sicherheitsgruppen können nur von einem Microsoft Entra-Administrator implementiert werden.
    
- Sowohl normale Benutzer als auch Microsoft Entra-Administratoren können Microsoft 365-Gruppen verwenden.

#### Was muss beachtet werden?

Wenn Sie einer Gruppe Mitglieder hinzufügen, können Sie ihnen auf verschiedene Weise Zugriffsrechte zuweisen. Überlegen Sie beim Durchlesen dieser Optionen, welche Gruppen Sie zur Unterstützung Ihrer Organisation benötigen und welche Zugriffsrechte den Gruppenmitgliedern zugewiesen werden sollen.

|Zugangsrechte|Beschreibung|
|---|---|
|**Zugewiesen**|Fügen Sie bestimmte Benutzer als Mitglieder einer Gruppe hinzu, wobei jeder Benutzer individuelle Berechtigungen haben kann.|
|**Dynamischer Benutzer**|Verwenden Sie dynamische Mitgliedschaftsregeln, um Gruppenmitglieder automatisch hinzuzufügen und zu entfernen. Wenn sich Mitgliedsattribute ändern, überprüft Azure die dynamischen Gruppenregeln für das Verzeichnis. Wenn die Mitgliedsattribute die Regelanforderungen erfüllen, wird das Mitglied der Gruppe hinzugefügt. Wenn die Mitgliedsattribute die Regelanforderungen nicht mehr erfüllen, wird das Mitglied entfernt.|
|**Dynamisches Gerät**|( _Nur Sicherheitsgruppen_ ) Wenden Sie dynamische Gruppenregeln an, um Geräte in Sicherheitsgruppen automatisch hinzuzufügen und daraus zu entfernen. Wenn sich Geräteattribute ändern, überprüft Azure die dynamischen Gruppenregeln für das Verzeichnis. Wenn die Geräteattribute die Regelanforderungen erfüllen, wird das Gerät der Sicherheitsgruppe hinzugefügt. Wenn die Geräteattribute die Regelanforderungen nicht mehr erfüllen, wird das Gerät entfernt.|











<br>
<br>

> [**➯ Weiter zu ""**](./) <br>
> [**⌂ Zurück zur Hauptseite**](https://gitlab.com/e-portfolio1/hf-cloud-native-engineer/semesterarbeiten/semesterarbeit-1)
