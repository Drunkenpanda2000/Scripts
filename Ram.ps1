$strComputer = read-host "Computer Name"
 
$colItems = get-wmiobject -class "Win32_PhysicalMemory" -namespace "root\CIMV2" -computername $strComputer 
 
foreach ($objItem in $colItems) { 
      write-host "------------------------------"
      write-host "----New Ramdisk Begins Here---"
      write-host "------------------------------"
      write-host "Caption: " $objItem.Caption 
      write-host "------------------------------"
      switch ($objItem.MemoryType) {
            1  { $result = "other"}
            2  { $result = "DRAM"}
            3  { $result = "Synchronous DRAM"}
            4  { $result = "Cache DRAM"}
            5  { $result = "EDO "}
            6  { $result = "EDRAM "}
            7  { $result = "VRAM "}
            8  { $result = "SRAM "}
            9  { $result = "RAM "}
            10  { $result = "ROM "}
            11  { $result = "Flash "}
            12  { $result = "EEPROM "}
            13  { $result = "FEPROM "}
            14 { $result = "EPROM  "}
            15 { $result = "CDRAM  "}
            16  { $result = "3DRAM  "}
            17 { $result = "SDRAM  "}
            18 { $result = "SGRAM  "}
            19  { $result = "RDRAM  "}
            20 { $result = "DDR 1" }
            21 { $result = "DDR 2" }
            22 { $result = "DDR 2 FB-DIMM" }
            24 { $result = "DDR 3" }
            25 { $result = "FBD2" }
            26 { $result = "No info Maybe DDR4" }
            27 { $result = "No info Maybe DDR5" }

      }
      write-host "Capacity: " $objItem.Capacity 
      write-host "Speed: " $objItem.Speed 
      write-host "Memory Type: " $result
      write-host "Bank Label: " $objItem.BankLabel 
      write-host "Device Locator: " $objItem.DeviceLocator
      write-host "------------------------------"
      write-host "Creation Class Name: " $objItem.CreationClassName 
      write-host "Data Width: " $objItem.DataWidth 
      write-host "Description: " $objItem.Description 
      write-host "Form Factor: " $objItem.FormFactor 
      write-host "Hot-Swappable: " $objItem.HotSwappable 
      write-host "Installation Date: " $objItem.InstallDate 
      write-host "Interleave Data Depth: " $objItem.InterleaveDataDepth 
      write-host "Interleave Position: " $objItem.InterleavePosition 
      write-host "Manufacturer: " $objItem.Manufacturer 
      write-host "Model: " $objItem.Model 
      write-host "Name: " $objItem.Name 
      write-host "Other Identifying Information: " $objItem.OtherIdentifyingInfo 
      write-host "Part Number: " $objItem.PartNumber 
      write-host "Position In Row: " $objItem.PositionInRow 
      write-host "Powered-On: " $objItem.PoweredOn 
      write-host "Removable: " $objItem.Removable 
      write-host "Replaceable: " $objItem.Replaceable 
      write-host "Serial Number: " $objItem.SerialNumber 
      write-host "SKU: " $objItem.SKU 
      write-host "Status: " $objItem.Status 
      write-host "Tag: " $objItem.Tag 
      write-host "Total Width: " $objItem.TotalWidth 
      write-host "Type Detail: " $objItem.TypeDetail 
      write-host "Version: " $objItem.Version 
      write-host 
} 