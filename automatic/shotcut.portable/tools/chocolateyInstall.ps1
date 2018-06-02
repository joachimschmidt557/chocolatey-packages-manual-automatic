$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.06/shotcut-win32-180601.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.06/shotcut-win64-180601.zip'
$checksum32 = '0322025166fc397b54e2019af0eeb32f905dc98eb36cb50f623abadd45fd9323'
$checksum64 = '9165d4072ce1b7cf430dd945415ea97ccb77755937400589e5f57c10ee0b2ab8'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
