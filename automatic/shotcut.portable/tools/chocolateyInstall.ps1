$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.08.16/shotcut-win32-190816.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.08.16/shotcut-win64-190816.zip'
$checksum32 = 'f808195535ccd57742a186d6b473b19662159a3ad8fe27426174379912878a3f'
$checksum64 = '430350f283f507a250aa32803afc7cdc83f7849a974fa620bd3b1b2815b6629a'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
