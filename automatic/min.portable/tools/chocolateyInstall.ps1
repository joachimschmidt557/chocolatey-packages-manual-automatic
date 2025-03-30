$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.35.0/Min-v1.35.0-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.35.0/Min-v1.35.0-windows.zip'
$checksum32 = '863a42898da625830ac78ca7c415710453fdcddf00c3f7c7f1858367e3b8130d'
$checksum64 = 'a80890fd3a72a63445bd39f86a9df40a9f9b2c562fd296dc87c3401c95f83c87'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
