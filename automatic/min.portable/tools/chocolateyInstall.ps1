$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.19.0/Min-v1.19.0-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.19.0/Min-v1.19.0-win32-x64.zip'
$checksum32 = 'e05d65f25122027c4cb96df5c193af3a93803c6ed46795663a8e45f44f5f813f'
$checksum64 = 'caa8b373170fed71c4b7707b1224e4fa6c353502c17fa7f900862bc61098b488'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
