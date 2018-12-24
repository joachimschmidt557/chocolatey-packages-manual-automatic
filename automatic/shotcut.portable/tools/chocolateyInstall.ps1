$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.12.23/shotcut-win32-181223.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.12.23/shotcut-win64-181223.zip'
$checksum32 = '77686ef536cf725dc8b1e2cea12add43fca0b43fe241034a3d9d79024b594d4c'
$checksum64 = '6cbf57c9dad37388aa6ade7afb20f2ddfedbbcd8e908d5d27ad4870507914b74'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
