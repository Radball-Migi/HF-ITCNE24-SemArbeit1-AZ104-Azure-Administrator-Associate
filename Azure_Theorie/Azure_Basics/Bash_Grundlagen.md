# Bash Grundlagen

  
Die Syntax für Bash ist wie folgt aufgebaut:

```Bash
command [options] [arguments]
```
  
Bash Verwendet immer den ersten String als Command

Im Bash können Commands mit Argumenten und/oder Optionen ausgeführt werden.

Als Beispiel hier, wird "ls" (list) verwendet.

``` Bash
ls /etc #Command with only argument ([PATH])

ls -a /etc #Command with option (-a) and argument
```

Bash ist so entwickelt worden, dass man nicht immer alles ausschreiben muss. Die Optionen/Flags können auch aneinander gebunden werden.

```Bash
ls -al /etc # -a = list all and -l = long listing format
```
 
Dieser Command wird wie oben ausgeführt, jedoch zum Unterschied, dass wir anstelle von "-a -l", "-al" schreiben.

Auch wenn dies nun relativ faul aussieht, kann das im Nachhinein in einem Script zum Vorteil werden, da es übersichtlicher sein kann.

## Hilfe im Bash

Welche Optionen und Argumente verwendet werden können oder müssen, ist von Befehl zu Befehl unterschiedlich. Glücklicherweise ist die Bash-Dokumentation in das Betriebssystem integriert. Um die Bash-Dokumentation zum Command zu öffnen, können wir dies mit dem "manual" machen.

```Bash
man mkdir
```

 Mit der Hilfe funktion in Bash, können wir die Syntax eines Command anzeigen lassen:

```Bash
mkdir --help
```

```Output
Usage: mkdir [OPTION]... DIRECTORY...

Create the DIRECTORY(ies), if they do not already exist.

Mandatory arguments to long options are mandatory for short options too.

  -m, --mode=MODE   set file mode (as in chmod), not a=rwx - umask

  -p, --parents     no error if existing, make parent directories as needed

  -v, --verbose     print a message for each created directory

  -Z                   set SELinux security context of each created directory

                         to the default type

      --context[=CTX]  like -Z, or if CTX is specified then set the SELinux

                         or SMACK security context to CTX

      --help     display this help and exit

      --version  output version information and exit

GNU coreutils online help: <[http://www.gnu.org/software/coreutils/](http://www.gnu.org/software/coreutils/)>

Report mkdir translation bugs to <[http://translationproject.org/team/](http://translationproject.org/team/)>

Full documentation at: <[http://www.gnu.org/software/coreutils/mkdir](http://www.gnu.org/software/coreutils/mkdir)>

or available locally via: info '(coreutils) mkdir invocation'
```

# Verwendung von Wildcards

  Wildcards sind Symbole, die in Bash-Befehlen ein oder mehrere Zeichen darstellen. Das am häufigsten verwendete Wildcard-Symbol ist das Sternchen (\*).

Es steht für null Zeichen oder eine Zeichenfolge. Angenommen, unser aktuelles Verzeichnis enthält Hunderte von Bilddateien, wir möchten jedoch nur die PNG-Dateien anzeigen, deren Dateinamen mit .png enden.

Dies ist der Befehl um nur diese Dateien aufzulisten:

```Bash    
ls *.png
```
 
 Beispielsweise bei den Bild Dateien, gibt es zwei endungen, welche fast gleich heissen (JPG und JPEG). Wenn wir nun all jene Dateien suchen, welche diese Endungen haben, können wir dies wie folgt ausführen:

```Bash
ls *.jpg *.jpeg
```

Oder auch auf die "faule"-Art:

```Bash    
ls *.jp*g
```

Das "\*" entspricht null oder mehr Zeichen.

Ein weiteres Wildcard-Symbol ist das Fragezeichen (?). Dieses steht für ein einzelnes Zeichen, an der angegeben Stelle.

Wenn das aktuelle Verzeichnis Dateien mit den Namen 0001.jpg , 0002.jpg usw. bis 0009.jpg enthält , können wir folgenden Command verwenden um diese Dateien anzuzeigen:

```Bash
ls 000?.jpg
```

Ein weiteres Wildcard-Symbol sind die eckigen Klammern ([ ]), die Zeichengruppen kennzeichnen.

Der folgende Befehl listet alle Dateien im aktuellen Verzeichnis auf, deren Namen einen Punkt gefolgt von einem kleinen J oder P enthalten.

Er listet somit alle .jpg -, .jpeg - und .png -Dateien auf, aber Beispielsweise keine .gif -Dateien:

```Bash
ls *.[jp]*
```

Da Linux im Case Sensitive geschrieben wird, muss dies auch in den Wildcards beachtet werden. Um dies nun zu berücksichtigen, müsste man den oben verwendeten Command wie folgt anpassen:

```Bash
ls *.[jpJP]*
```

Ausdrücke in eckigen Klammern können Zeichenbereiche darstellen. Der folgende Command listet beispielsweise alle Dateien im aktuellen Verzeichnis auf, deren Namen mit einem Kleinbuchstaben beginnen:

```Bash
ls [a-z]*
```

Und dieser Command macht das selbe nur mit den Grossbuchstaben (Beachten, Case Sensitive)

```Bash
ls [A-Z]*
```

Für die, welche sich nicht sicher sind ob es nun gross oder klein geschrieben sit, können beide Commands zusammenfassen und wie folgt ausführen:

```Bash  
ls [a-zA-Z]*
```

Wenn wir ein Wildcard-Symbol als normales Zeichen verwenden müssen, machen wir es wörtlich oder „escapen“ es, indem wir ihm einen Backslash (\\) voranstellen. Sollten wir aus irgendeinem Grund ein Asterisk (\*) als Teil eines Dateinamens haben – was wir niemals absichtlich tun sollten –, können wir mit einem entsprechenden Command danach suchen:

  

```Bash  
ls *\**
```

  
## Bash-Befehle und Operatoren

### Der Command ls

| Command | Beschreibung                                                                  |
| ------- | ----------------------------------------------------------------------------- |
| Ls      | Listet alle Inhalte des aktuellen Verzeichnisses                              |
| Ls -a   | Gleich wie oben, zusätzlich mit Operation -a um Hidden-Files mit aufzulisten. |
| Ls -l   | Gleich wie ls + Listet alles in einer Liste auf, mit Zusatzinformationen.     |

Output von ls -l:

```Output
-rw-rw-r-- 1 azureuser azureuser  473774 Jun 13 15:38 0001.png
-rw-rw-r-- 1 azureuser azureuser 1557965 Jun 13 14:43 0002.jpg
-rw-rw-r-- 1 azureuser azureuser  473774 Mar 26 09:21 0003.png
-rw-rw-r-- 1 azureuser azureuser 4193680 Jun 13 09:40 0004.jpg
-rw-rw-r-- 1 azureuser azureuser  423325 Jun 10 12:53 0005.jpg
-rw-rw-r-- 1 azureuser azureuser 2278001 Jun 12 04:21 0006.jpg
-rw-rw-r-- 1 azureuser azureuser 1220517 Jun 13 14:44 0007.jpg
drwxrwxr-x 2 azureuser azureuser    4096 Jun 13 20:16 gifs
```

Jede Zeile enthält detaillierte Informationen zur entsprechenden Datei oder zum entsprechenden Verzeichnis. Zu diesen Informationen gehören die ihr zugewiesenen Berechtigungen, ihr Besitzer, ihre Größe in Bytes, das letzte Änderungsdatum und der Datei- oder Verzeichnisname.

### Der Command cat

Angenommen, wir möchten sehen, was in einer Datei steht. Dafür können wir den Command cat verwenden. Die Ausgabe ist allerdings nur sinnvoll, wenn es sich um eine Textdatei handelt. Der folgende Command zeigt den Inhalt der Datei os-release an, die im Verzeichnis /etc gespeichert ist:

```Bash
cat /etc/os-release
```

Als Output erhalten wir folgendes:

```Output
    NAME="Ubuntu"

    VERSION="18.04.2 LTS (Bionic Beaver)"

    ID=ubuntu

    ID_LIKE=debian

    PRETTY_NAME="Ubuntu 18.04.2 LTS"

    VERSION_ID="18.04"

    HOME_URL="https://www.ubuntu.com/"

    SUPPORT_URL="https://help.ubuntu.com/"

    BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"

    PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"

    VERSION_CODENAME=bionic

    UBUNTU_CODENAME=bionic
```

### Der sudo Command

Der Sudo Command ermöglicht es uns Task, Scripts oder auch einzelne Commands als Admin auszuführen. Sudo heisst ausgesprochen: "Superuser do".

Auch wenn wir als Admin eingeloggt sind, können wir anfangs keine Admin-Tasks oder Skripts ausführen.

Um unter Linux diese rechte nutzen zu können, müssen wir dies mit dem Command sudo, am Anfang des Commands, starten.

Danach wird gleich das Login abgefragt.

Im Endeffekt, möchten wir ja nicht die ganze Zeit mit Adminrechten auf dem Client sein was auch gefährlich ist. Aus diesem Grund, führen wir Befehle mit Adminrechte mit Sudo aus. Dann sind die Berechtigungen für den Admin nur für diesen Command freigegeben.

### Der cd, mkdir und rmdir Command

Der cd Command steht für "Change Directory". Wie es der Name bereits sagt, wechselt er vom einen Verzeichnis in das andere.

Anhand des Bsp., wechseln wir mit dem Command in das Verzeichnis "orders"

```Bash
cd orders
```
  
Um eine Ebene höher, respektive zurück zu kehren, können wir dies mit:

```Bash
cd ..
```

Um ins Homedirectory des aktuell angemeldeten Benutzers zu gelangen, können wir dies mit dem Tilde Zeichen ausführen:
  
```Bash
cd ~
```

Um ein Verzeichnis zu erstellen, verwenden wir folgenden Command:

Mit diesem Command erstellen wir den Ordner "orders"
  
```Bash
Mkdir orders
```
  
Wenn wir einen Ordner erstellen möchten, mit einem enthaltenen unterordner, dann können wir dies wie folgt ausführen:

Wichtig dabei ist, die option "--parents" mit zugeben.

Dieser Command erstellt den Ordner "orders" und darin den Ordner "2019".

  
```Bash
mkdir --parents orders/2019
```

Um Verzeichnisse zu löschen, können wir den Command rmdir verwenden.

Dieser Command löscht das Verzeichnis, jedoch nur wenn es leer ist.

Wenn wir ein Verzeichnis mit Daten löschen möchten, dann müssen wir das mit der Option "recursive (-r)" ausführen.

```Bash
rmdir -r
```

Um Files mit Bash zu löschen, gibt es den Command rm. Die Syntax ist wie folgt:

```Bash
rm 001.jpg
```

Um alles im aktuellen Verzeichnis zu löschen, können wir rm mit einer Wildcard ausführen:

```Bash
rm *
```

Damit es nicht soweit kommt, dass wir Daten löschen, welche nicht gelöscht werden sollen, können wir dies mit der Option -i (Interaktiv) lösen.

Bei diesem Command werden wir nochmals gefragt, ob es wirklich gelöscht werden soll

```Bash
rm -i
```
  

Um ganze Laufwerke zu löschen, wird der rm befehl mit -rf ausgeführt. Das -f steht für force.

Mit diesem Beispiel vernichten wir eine ganze Maschine, da das Root-Laufwerk gelöscht wird:

```Bash
rm -rf /
```


### Der Command cp

Der cp Command ist um Dokumente und Verzeichnisse zu kopieren.

Wenn cp auf eine Datei angewendet wird, wobei das Zielobjekt vom Namen her bereits besteht, dann wir das Zielobjekt einfach überschrieben.

Um dies zu Verhindern, kann man dies wieder mit der Option -i lösen.

Egal ob nun -i drauf ist oder nicht, die Syntax bleibt gleich, cp -> zu kopierendes Objekt -> Name Zielobjekt

```Bash
cp -i 0001.jpg 0002.jpg
```

Um alle Files aus dem aktuellen Verzeichnis zu kopiern und in einem neuen Verzeichnis zu speichern, kann dieser Command verwendet werden:
```Bash
cp * photos
```

Um alle Dateien in einem Unterverzeichnis namens „ Fotos“ in ein Unterverzeichnis namens „ Bilder“ zu kopieren , gehen Sie wie folgt vor:

```Bash
cp photos/* images
```

### Der Command ps

Der ps Command zeigt uns alle laufenden Prozesse an.

Mit dem -e Flag, können wir mehr infos anzeigen lassen.

Wiederum mit dem -ef Flag, werden uns noch mehr Infos angezeigt.

Dieses Flag zeigt die Namen aller laufenden Prozesse, ihre Prozessidentifikationsnummern (PIDs), die PIDs ihrer übergeordneten Prozesse (PPIDs) und wann sie gestartet sind (STIME). Es zeigt auch an, an welches Terminal sie angeschlossen sind (TTY), wie viel CPU-Zeit sie verbraucht haben (TIME) und ihre vollständigen Pfadnamen. Hier ist ein verkürztes Beispiel:

```Output
UID         PID   PPID  C STIME TTY          TIME CMD
root          1      0  0 13:35 ?        00:00:03 /sbin/init
root          2      0  0 13:35 ?        00:00:00 [kthreadd]
root          3      2  0 13:35 ?        00:00:00 [rcu_gp]
root          4      2  0 13:35 ?        00:00:00 [rcu_par_gp]
root          5      2  0 13:35 ?        00:00:00 [kworker/0:0-cgr]
root          6      2  0 13:35 ?        00:00:00 [kworker/0:0H-kb]
root          8      2  0 13:35 ?        00:00:00 [mm_percpu_wq]
root          9      2  0 13:35 ?        00:00:01 [ksoftirqd/0]
root         10      2  0 13:35 ?        00:00:02 [rcu_sched]
```

Als Systemadministratoren müssen wir den Zugang von Mitarbeitern, die das Unternehmen verlassen haben, zu den Computersystemen des Unternehmens verwalten. Wir müssen auch wissen, wer sich auf unseren Servern befindet. Dafür können wir den Linux-Befehl "w" verwenden, der uns detaillierte Informationen über die angemeldeten Benutzer und ihre Aktivitäten liefert.

### Input / Output Operator

Um die Scripts zu verbessern sollten Input Output Operatoren Verwendet werden.

Folgende Operatoren stehen zur Verfügung:

  - "<" -> Umleitung der Eingabe auf eine andere Quelle als die Tastatur (File)

  - ">" -> Umleitung der Ausgabe an ein anderes Ziel als den Bildschirm (File)

  - ">>" -> Umleitung der Ausgabe an ein anderes Ziel als den Bildschirm (File), anstelle dass es überschrieben wird, wird es angefügt

  - "|" -> Weiterleiten der Ausgabe eines Command an die Eingabe eines anderen Command

Angenommen, wir möchten alles im aktuellen Verzeichnis auflisten, die Ausgabe aber in einer Datei mit dem Namen listing.txt erfassen:

```Bash
ls > listing.txt
```

Wenn listing.txt bereits vorhanden ist, wird es überschrieben. Wenn wir aber möchten, dass er den Output trotzdem ins Dokument schreiben soll, dann geben wir ihm den Operator >> mit:

  
```Bash
ls >> listing.txt
```

Der Piping-Operator ist extrem leistungsstark (und wird häufig verwendet). Er leitet die Ausgabe des ersten Befehls an die Eingabe des zweiten Befehls um. Das beste Beispiel ist hierbei ein Exportfile, welches zuerst in einer Liste gemäss Anforderungen angepasst wird und anschliessend exportiert wird.

Der folgende Befehl listet alle aktuell laufenden Prozesse auf. Sobald der Bildschirm jedoch voll ist, wird die Ausgabe angehalten, bis Sie die Eingabetastemore drücken, um die nächste Zeile anzuzeigen:

```Bash
ps -ef | more
```

Wenn wir eine Datei als Input verwenden möchten, dann führen wir das wie folgt aus:

```Bash
sort < file.txt
```

Möglich wäre es auch mit dem Befehl oben, diesen zu Sortieren und das Ergebnis in ein neues File zu speichern:

```Bash
sort < file.txt > sorted_file.txt
```


<br>
<br>

> [**⇤ Zurück zu Azure Bash**](./Azure_Bash.md) <br>
> [⌂ **Zurück zur Hauptseite**](https://gitlab.com/e-portfolio1/hf-cloud-native-engineer/semesterarbeiten/semesterarbeit-1)