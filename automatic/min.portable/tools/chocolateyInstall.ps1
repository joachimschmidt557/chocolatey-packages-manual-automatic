$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.32.0/Min-v1.32.0-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.32.0/Min-v1.32.0-windows.zip'
$checksum32 = '8e5cf9da04335f0a5f891862d1bef4908a0ab5c87fb2d2d4793e8a7227069af2'
$checksum64 = 'c54c8c1891f71073ee08e841fea5c3d12ce63476ef36f91cd1f25ab33cca9e18'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
