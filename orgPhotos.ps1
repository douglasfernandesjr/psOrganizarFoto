#functions
function DefaultFolderValue {
    param([string]$inputSrt)

    if ([string]::IsNullOrEmpty($inputSrt)) {
        return '.\'
    }
    elseif ( !($inputSrt[-1] -eq '\')) {
        return $inputSrt + '\' 
    }else{
        $inputSrt
    }
}


#Input Params
$srcFolder = $args[0]
$targetFolder = $args[1]

$srcFolder = DefaultFolderValue -inputSrt $srcFolder
$targetFolder = DefaultFolderValue -inputSrt $targetFolder

write-host $srcFolder 
write-host $targetFolder

