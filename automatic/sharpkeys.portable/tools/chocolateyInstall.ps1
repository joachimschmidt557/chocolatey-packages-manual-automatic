$packageName = 'sharpkeys.portable'
$url = 'https://github.com/randyrants/sharpkeys/releases/download/v3.6/sharpkeys36.zip'
$checksum = '79bbfb6dcd9e050d33e963d015302dacd83d0e7f43346c2f1153ee113d36ded1'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType"
