$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v1.22/VNote_win_x86_portable_1.22.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v1.22/VNote_win_X64_portable_1.22.zip'
$checksum32 = '7c807c29f536a627231ec6ca0334e1da9fc01c799d4d23e6c052bdc21bac3413'
$checksum64 = 'd6ba3d7294d2861fe2404ba2c34677ee4644f7da37a5e5ddb455919fac331129'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
