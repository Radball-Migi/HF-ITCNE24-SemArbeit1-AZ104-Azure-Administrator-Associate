## Auswählen eines Verteilungsmodus

Stellen Sie sich im Beispiel des Gesundheitsportals vor, dass eine Entwickleranforderung der Präsentationsebene darin besteht, In-Memory-Sitzungen zu verwenden, um das Profil des angemeldeten Benutzers zu speichern, während der Benutzer mit dem Portal interagiert.

In diesem Szenario muss der Lastenausgleich Quell-IP-Affinität bereitstellen, um die Sitzung eines Benutzers aufrechtzuerhalten. Das Profil wird nur auf der virtuellen Maschine gespeichert, mit der der Client zuerst eine Verbindung herstellt, da diese IP-Adresse an denselben Server weitergeleitet wird. Wenn Sie den Lastenausgleichsendpunkt erstellen, müssen Sie den Verteilungsmodus mithilfe des folgenden PowerShell-Beispiels angeben:

```PowerShell
$lb = Get-AzLoadBalancer -Name MyLb -ResourceGroupName MyResourceGroup
$lb.LoadBalancingRules[0].LoadDistribution = 'sourceIp'
Set-AzLoadBalancer -LoadBalancer $lb
```

So fügen Sie Sitzungspersistenz über das Azure-Portal hinzu:

1. Wählen Sie im Azure-Portal Ihre Load Balancer-Ressource aus.
    
2. Wählen Sie auf der Seite **„Lastausgleichsregeln“ im Bereich** _„Einstellungen“_ die entsprechende Lastausgleichsregel aus.
    
    ![Screenshot, der zeigt, wie eine Lastenausgleichsregel im Azure-Portal ausgewählt wird.](Images/Azure_LoadBalancer_Distribution_Mode_1.png) 
    
3. Ändern Sie auf der _Einstellungsseite der Lastausgleichsregel_ den Wert für **Sitzungspersistenz** von **Keine** in **Client-IP** .
    

![Screenshot, der zeigt, wie die IP-Affinität im Azure-Portal festgelegt wird.](Images/Azure_LoadBalancer_Distribution_Mode_2.png)