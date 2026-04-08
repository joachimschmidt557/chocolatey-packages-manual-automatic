$packageName = 'shotcut.portable'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v26.4.6/shotcut-win64-26.4.6.zip'
$checksum64 = '3b52b57a5a8412cef0d39cedf63384727a362ba4fb1e4f9dc946feb1496d65ce'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
