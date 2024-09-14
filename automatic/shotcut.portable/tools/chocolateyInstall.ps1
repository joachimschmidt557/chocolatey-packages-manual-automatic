$packageName = 'shotcut.portable'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v24.09.13/shotcut-win64-240913.zip'
$checksum64 = '9c65fde8bce5031d3cca75ae27bcdb3a87f52bba3d64ba2b438391315949e8d2'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
