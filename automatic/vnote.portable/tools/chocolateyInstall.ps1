$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.15.1/vnote-win-x86-qt5.15.2_v3.15.1.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.15.1/vnote-win-x64-qt5.15.2_v3.15.1.zip'
$checksum32 = '64854e20c4a85c83735e1f049bea81f3b143f43ac89d72d63bae9c0e9776b36a'
$checksum64 = '8dc5f34d980cec18794cc6c29304b8b5c8e198d2d541f3b46c0ce384987709bc'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
