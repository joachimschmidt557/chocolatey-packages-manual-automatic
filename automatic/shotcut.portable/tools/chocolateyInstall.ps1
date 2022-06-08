$packageName = 'shotcut.portable'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v22.06.07/shotcut-win64-220607.zip'
$checksum64 = 'bee976422ab6fb145a25a6170155dd2778f11a553f773f1641f08c4f69b5cd13'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
