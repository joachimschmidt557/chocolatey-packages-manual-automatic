$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.32.1/Min-v1.32.1-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.32.1/Min-v1.32.1-windows.zip'
$checksum32 = '6e0d4dec2991a00d209d609044b088c411f8db8f9206e5eab6eb87f56638ccf0'
$checksum64 = 'dbc1e52c54c88be2f649e01059a570eea54d781785e39c360cd46de6b885a43c'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
