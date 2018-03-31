$packageName = 'fd'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.03/shotcut-win32-180306.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.03/shotcut-win64-180306.zip'
$checksum32 = '1d35c72bbd91189e86dd4d3f088da1bb5ffe7e11c856aa00d3f95073053c7c39'
$checksum64 = '0b96dc52fd9fe6ea42a81490c422be2f3ca6e83e362a465726c2d40eb680c942'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
