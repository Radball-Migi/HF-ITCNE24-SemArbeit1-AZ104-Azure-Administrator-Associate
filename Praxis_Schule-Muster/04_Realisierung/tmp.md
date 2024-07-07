## Create IP addresses

First, we need a public IP address for the load balancer.

1. In Cloud Shell, start PowerShell by running this command:
    
    BashCopy
    
    ```
    pwsh
    ```
    
2. In PowerShell, create a new public IP address:
    
    PowerShellCopy
    
    ```
    $Location = $(Get-AzureRmResourceGroup -ResourceGroupName az-rg-srv-homepage-3).Location
    
    $publicIP = New-AzPublicIpAddress `
      -ResourceGroupName az-rg-srv-homepage-3 `
      -Location $Location `
      -AllocationMethod "Static" `
      -Name "myPublicIP"
    ```
    
3. Create a front-end IP by using the **New-AzLoadBalancerFrontendIpConfig** cmdlet. The following code creates a front-end IP configuration named **myFrontEnd** and attaches the **myPublicIP** address:
    
    PowerShellCopy
    
    ```
    $frontendIP = New-AzLoadBalancerFrontendIpConfig `
      -Name "myFrontEnd" `
      -PublicIpAddress $publicIP
    ```
    

## Create the load balancer

When you use PowerShell to configure a load balancer, you must create the back-end address pool, the health probe, and the rule before you create the balancer itself.

1. Create a back-end address pool by running the **New-AzLoadBalancerBackendAddressPoolConfig** cmdlet. You'll attach the virtual machines to this back-end pool in the final steps. The following example creates a back-end address pool named **myBackEndPool**:
    
    PowerShellCopy
    
    ```
    $backendPool = New-AzLoadBalancerBackendAddressPoolConfig -Name "myBackEndPool"
    ```
    
2. Create a health probe to allow the load balancer to monitor the status of the healthcare portal. The health probe dynamically adds or removes virtual machines from the load balancer rotation based on their response to health checks.
    
    PowerShellCopy
    
    ```
    $probe = New-AzLoadBalancerProbeConfig `
      -Name "myHealthProbe" `
      -Protocol http `
      -Port 80 `
      -IntervalInSeconds 5 `
      -ProbeCount 2 `
      -RequestPath "/"
    ```
    
3. You now need a load balancer rule to define how traffic is distributed to the virtual machines. You define the front-end IP configuration for the incoming traffic and the back-end IP pool to receive the traffic, along with the required source and destination port. To make sure only healthy virtual machines receive traffic, you also define the health probe to use.
    
    PowerShellCopy
    
    ```
    $lbrule = New-AzLoadBalancerRuleConfig `
      -Name "myLoadBalancerRule" `
      -FrontendIpConfiguration $frontendIP `
      -BackendAddressPool $backendPool `
      -Protocol Tcp `
      -FrontendPort 80 `
      -BackendPort 80 `
      -Probe $probe
    ```
    
4. Now, you can create the basic load balancer by running the **New-AzLoadBalancer** cmdlet:
    
    PowerShellCopy
    
    ```
    $lb = New-AzLoadBalancer `
      -ResourceGroupName az-rg-srv-homepage-3 `
      -Name 'MyLoadBalancer' `
      -Location $Location `
      -FrontendIpConfiguration $frontendIP `
      -BackendAddressPool $backendPool `
      -Probe $probe `
      -LoadBalancingRule $lbrule
    ```
    
5. Connect the virtual machines to the back-end pool by updating the network interfaces that the script created to use the back-end pool information.
    
    PowerShellCopy
    
    ```
    $nic1 = Get-AzNetworkInterface -ResourceGroupName az-rg-srv-homepage-3 -Name "webNic1"
    $nic2 = Get-AzNetworkInterface -ResourceGroupName az-rg-srv-homepage-3 -Name "webNic2"
    
    $nic1.IpConfigurations[0].LoadBalancerBackendAddressPools = $backendPool
    $nic2.IpConfigurations[0].LoadBalancerBackendAddressPools = $backendPool
    
    Set-AzNetworkInterface -NetworkInterface $nic1 -AsJob
    Set-AzNetworkInterface -NetworkInterface $nic2 -AsJob
    ```
    
6. Run the following command to get the load balancer's public IP address and your website's URL:
    
    PowerShellCopy
    
    ```
    Write-Host http://$($(Get-AzPublicIPAddress `
      -ResourceGroupName az-rg-srv-homepage-3 `
      -Name "myPublicIP").IpAddress)
    ```
    

## Test the load balancer configuration