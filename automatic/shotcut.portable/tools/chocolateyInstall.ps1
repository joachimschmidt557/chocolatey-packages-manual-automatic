$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.01.27/shotcut-win32-190127.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.01.27/shotcut-win64-190127.zip'
$checksum32 = 'b4db56674cbde2c9143d2905e8209d319715521e421bb3c3d7d56dc77fd06e6a'
$checksum64 = '47dfde1b252647abf4b5338c46a96314356220141b6ca31ef53a02c2dac0c470'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
