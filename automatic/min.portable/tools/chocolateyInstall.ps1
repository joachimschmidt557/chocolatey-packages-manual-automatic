$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.9.0/Min-v1.9.0-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.9.0/Min-v1.9.0-win32-x64.zip'
$checksum32 = 'a9911d642d5dd2db800d2cc3c2c698a2501b5b645431b06db663449aa3d0b8ed'
$checksum64 = 'd6261c1b228c4af5dac76970884f9388ab1dc942e2edfb45fc515383b883bbd7'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
