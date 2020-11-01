$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.16.1/Min-v1.16.1-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.16.1/Min-v1.16.1-win32-x64.zip'
$checksum32 = 'f694ed84416db3c2e4eb0d590b028c5b1cff1a84b62bfcf1bbb22ecdc5ba2902'
$checksum64 = '31e8e647fef39ffaeec137b648b9d72eac70cb0d61c1ed926e7d514aa87061ba'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
