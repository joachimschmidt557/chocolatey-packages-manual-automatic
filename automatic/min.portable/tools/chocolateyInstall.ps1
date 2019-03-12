$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.9.2/Min-v1.9.2-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.9.2/Min-v1.9.2-win32-x64.zip'
$checksum32 = '880a13b9d1057f7a554eaa9f9cafd8099ee8494d8758435e8aadc6c5d77e7e85'
$checksum64 = 'f4c14043fbd635a02baafc610fbc6e65cb63d20331874a2d87e4db503a942685'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
