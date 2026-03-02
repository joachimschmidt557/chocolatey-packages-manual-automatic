$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.35.4/Min-v1.35.4-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.35.4/Min-v1.35.4-windows.zip'
$checksum32 = '2f710b1056f4e9e61651cba247efc78dfd044736dc6308c75d5cadc142493f5a'
$checksum64 = '6e1593185dcc1fc2b29c50cba429336b05847b1906ad47fdb0ab092d42a5e09c'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
