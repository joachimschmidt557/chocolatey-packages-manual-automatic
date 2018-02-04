$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.7.0/Min-v1.7.0-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.7.0/Min-v1.7.0-win32-x64.zip'
$checksum32 = '9c15592389a7e86109519a840fa4fcc69f63f49057f207e37f050a5860007c2d'
$checksum64 = '99696e33429fd84f9175b9498869891f809a0fbb8618f58deaaaef2945e3d59d'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
