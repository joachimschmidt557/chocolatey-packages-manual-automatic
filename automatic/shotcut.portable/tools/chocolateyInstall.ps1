$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.09.14/shotcut-win32-190914.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.09.14/shotcut-win64-190914.zip'
$checksum32 = '0c85c07ae965b2f9f7c2c019ea686a7d1ae110b9551657ec95049738d5788784'
$checksum64 = 'c05d124bd5e5acdd3584f26483e792b8d4306c5044e8dc403ebe2bea827ea07a'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
