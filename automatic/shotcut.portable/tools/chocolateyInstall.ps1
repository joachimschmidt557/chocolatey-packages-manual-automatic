$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.08.11/shotcut-win32-180811.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.08.11/shotcut-win64-180811.zip'
$checksum32 = 'c440e41fa7e817f2ccb4100ddd890b4af702473c2e146b4c9fc664bc292e765b'
$checksum64 = '2adb9ea6c50723dc998b6d3a577f8ba6b088147afe249db252448e3ef8a87b25'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
