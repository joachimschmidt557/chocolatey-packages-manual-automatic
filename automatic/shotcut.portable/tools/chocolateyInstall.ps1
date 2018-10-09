$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.10.08/shotcut-win32-181008.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.10.08/shotcut-win64-181008.zip'
$checksum32 = '03a3de07222493ee92fdab661949a658201a3ea13b922faeebbaf99e938a6342'
$checksum64 = '7f042d2aad4709f0778073fd351a54e2cfe6a3f6638ff7878f34ca7bddbb8aef'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
