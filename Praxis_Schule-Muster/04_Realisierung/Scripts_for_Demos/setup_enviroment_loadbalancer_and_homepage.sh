git clone https://github.com/Radball-Migi/downloads #Clone Repo for Files
cd downloads/Demo_Homepage_Loadbalancer_Schule_Muster/ #Change to directory


bash create-high-availability-vm-with-sets.sh azrgsmsrvhomepage

pause

#Now work with the Azure CLI
az network public-ip create --resource-group azrgsmsrvhomepage --allocation-method Static --name myPublicIP

pause

az network lb create --resource-group azrgsmsrvhomepage --name myLoadBalancer --public-ip-address myPublicIP --frontend-ip-name myFrontEndPool --backend-pool-name myBackEndPool

pause

az network lb probe create --resource-group azrgsmsrvhomepage --lb-name myLoadBalancer --name myHealthProbe --protocol tcp --port 80

pause

az network lb rule create --resource-group azrgsmsrvhomepage --lb-name myLoadBalancer --name myHTTPRule --protocol tcp --frontend-port 80 --backend-port 80 --frontend-ip-name myFrontEndPool --backend-pool-name myBackEndPool --probe-name myHealthProbe

pause

az network nic ip-config update --resource-group azrgsmsrvhomepage --nic-name webNic1 --name ipconfig1 --lb-name myLoadBalancer --lb-address-pools myBackEndPool

pause

az network nic ip-config update --resource-group azrgsmsrvhomepage --nic-name webNic2 --name ipconfig1 --lb-name myLoadBalancer --lb-address-pools myBackEndPool

pause

echo http://$(az network public-ip show --resource-group azrgsmsrvhomepage --name myPublicIP --query ipAddress --output tsv)