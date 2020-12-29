$pool_name = "TestPool"
$site_name = "TestSite"
$packagepath = "C:\Temp"

if(!(Test-Path IIS:\AppPools\$pool_name ))
{
    #create the app pool
    New-WebAppPool -Name $pool_name -Force
}
else {
    echo "Pool exists"
}

#check if the site exists
if(!(Test-Path IIS:\Sites\$site_name  ))
{
   New-Website -Name $site_name -ApplicationPool $pool_name -Force -PhysicalPath $packagepath -Port 8083
}
else {
    echo "site exists"
}
