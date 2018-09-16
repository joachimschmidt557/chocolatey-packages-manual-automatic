$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.09.15/shotcut-win32-180915.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.09.15/shotcut-win64-180915.zip'
$checksum32 = 'b78328436832562f4f68a6063c0d1549eb89c02ea6db8997ba5e0f47f6ff21ae'
$checksum64 = '3c1b4e867e62af8cde3ceb5faafea52bbd8cd63190b127a43abe54c5fdd7eba0'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
