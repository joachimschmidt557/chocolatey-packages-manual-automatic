$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.11.13/shotcut-win32-181113.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.11.13/shotcut-win64-181113.zip'
$checksum32 = 'bb3f634666b9cf1eca2bd0797f5dc9e61dd09dc5a45ed797226541e37e0d51cb'
$checksum64 = '780fd8e7b653262f278d3c2dfed3090fa7d9cebd3ca1989cc822f44c55407209'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
