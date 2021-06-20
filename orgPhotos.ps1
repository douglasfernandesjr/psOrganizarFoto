#Input Params
param ($src,$target,$debugMode)
$srcFolder = $src
$targetFolder = $target

#functions
function DefaultFolderValue {
    param([string]$inputSrt)

    if ([string]::IsNullOrEmpty($inputSrt)) {
        return '.\'
    }
    elseif ( !($inputSrt[-1] -eq '\')) {
        return $inputSrt + '\' 
    }
    else {
        $inputSrt
    }
}

function OrgPhotos {
    param([string]$srcRoot, [string]$dstRoot, [bool]$debugMode)

    $fileList = Get-ChildItem -Path $srcRoot -File -Recurse

    $shell = New-Object -COMObject Shell.Application
    $matchPattern = '(?<DAY>[0-9]{2})(?<MONTH>[0-9]{2})(?<YEAR>[0-9]{4})';

    $i = 0;

    foreach ($file in $fileList) {  
        $folderPath = Split-Path $file.FullName
        $objFolder = $shell.Namespace($folderPath)
        $shellfile = $objFolder.ParseName($file.Name)
        $taken = $objFolder.getDetailsOf($shellfile, 12) -replace '[^0-9]', ''
        $midia = $objFolder.getDetailsOf($shellfile, 209) -replace '[^0-9]', ''

        $year = ""
        $month = ""
        $day = ""

        if ($taken -match $matchPattern) {
            $year = $Matches.YEAR
            $month = $Matches.MONTH
            $day = $Matches.DAY
        }
        elseif ($midia -match $matchPattern) {
            $year = $Matches.YEAR
            $month = $Matches.MONTH
            $day = $Matches.DAY
        }
        else {
            $year = $file.LastWriteTime.ToString("yyyy")
            $month = $file.LastWriteTime.ToString("MM")
            $day = $file.LastWriteTime.ToString("dd")
        }
     
        $newPath = $dstRoot + $year + "\" + $month + "\" + $day
        $fileNewFullName = $newPath + "\" + $file.Name
       

        if ($debugMode) {
            Write-Output $file.FullName 
            Write-Output $fileNewFullName 
        }
        else {
           
            If (!(test-path $newPath )) {
                New-Item -ItemType Directory -Force -Path $newPath
            }

            Move-Item -Path $file.FullName -Destination $fileNewFullName   -Force
        }

        $i++;
    }
    if (!$debugMode) {
        write-host $i " arquivos movidos com sucesso"
    }
    else {
        write-host $i " arquivos listados"
    }
}



#Exec
$srcFolder = DefaultFolderValue -inputSrt $srcFolder

if ([string]::IsNullOrEmpty($targetFolder)) {
    $targetFolder = $srcFolder
}
else {
    $targetFolder = DefaultFolderValue -inputSrt $targetFolder
}

$debug = $false;
if ($debugMode -eq 1) {
    $debug = $true 
}

if ($debug) {
    write-host $srcFolder 
    write-host $targetFolder
}

OrgPhotos -srcRoot $srcFolder  -dstRoot $targetFolder -debugMode $debug
