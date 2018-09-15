$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.09.13/shotcut-win32-180913.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.09.13/shotcut-win64-180913.zip'
$checksum32 = 'e2db98efc1ba6a1f0ed16cf5eda37be3cbbde1507c7e0e4c292e53d66d2d0471'
$checksum64 = '9d0c53cb8f83ada88696a2c3a65679783b6d3772876118f1c62bf4f22eab2287'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
