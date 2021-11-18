$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.10.1/vnote-win-x86_v3.10.1.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.10.1/vnote-win-x64_v3.10.1.zip'
$checksum32 = '94793b5ee0d0df358e23e5bae1c536d21f4acdbcb9ed9d250a59a98632d8813d'
$checksum64 = '62a218d6d9c575a9cc6d918de57dae080953ea8fe63e7116bbd3c8b6be227e7d'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
