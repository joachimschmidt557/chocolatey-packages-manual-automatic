$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.05/shotcut-win32-180503.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.05/shotcut-win64-180503.zip'
$checksum32 = 'c9f4841fc9ade3a4a7022f76b48f794685ffbc967e1333471932fa8881e3ead0'
$checksum64 = '044230e298348e7f2d39fd198a713320720c401e8b50e786e494f067d8e1bfcd'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
