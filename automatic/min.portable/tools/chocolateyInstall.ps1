$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.33.1/Min-v1.33.1-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.33.1/Min-v1.33.1-windows.zip'
$checksum32 = '7ee4128767152658d822f52f43e06913020f6008f981a83bb7e033fc36b6ade0'
$checksum64 = '14ef6a544dee6d894a08ca9af31d001417e84223dc6cbbb849e6528430292907'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
