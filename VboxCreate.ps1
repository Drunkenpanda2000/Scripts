# Created by Nic Tanghe 
# This is for VM's in the powershells user folder

$Name = Read-Host 'What is your preffered VM Name'
$DriveName = $Name + "Drive"
$Install_Iso = Read-Host "What is your iso's full path"
$IDEName = $name + "IDE"
$SATAName = $Name + "SATA"

write-host $IDEName
Write-Host $SATAName

[uint16]$Memory = Read-Host 'What is your preffered Ram in mb for gb * 1024'

# Ask for storage size between 0 - 100 gb

do {
    try {
        $numOk = $true
        [int]$GetMyANumber = Read-host "What is your preffered VDI size in GB(between 0 and 100)"
        } # end try
    catch {$numOK = $false}
    } # end do 
until (($GetMyANumber -ge 1 -and $GetMyANumber -lt 100) -and $numOK)

[uint16]$VDI =$GetMyANumber * 1024


# Quick test

# Write-host 
# Write-host $DriveName
# Write-host $Memory
# Write-host $VDI

# Create and configure vm

 VBoxManage createvm --name $Name --register
 VBoxManage modifyvm $Name --nic1 bridged
 VBoxManage modifyvm $Name --memory $Memory

# Create storage medium

 set-location "C:\Users\$env:UserName\VirtualBox VMs\$Name"
 
 VBoxManage createmedium disk --filename $Drivename --size $VDI

# create storage Devices

 VBoxManage storagectl $Name --name $IDEName --add ide
 VBoxManage storagectl $Name  --name $SATAName --add SATA

# Attach storage medium's
 VBoxManage storageattach $Name --storagectl $SATAName --medium "C:\Users\$env:UserName\VirtualBox VMs\$Name\$DriveName.vdi" --port 1 --type HDD
 VBoxManage storageattach $Name --storagectl $IDEName --medium $Install_Iso --port 1 --type dvddrive --device 1