$packageName = 'shotcut.portable'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v22.04.22/shotcut-win64-220422.zip'
$checksum64 = '3c23d50046e710f71a7dbe6274ea8cc068d1758c2a4b4f8716124f731deffb4a'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
