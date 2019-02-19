$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.9.1/Min-v1.9.1-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.9.1/Min-v1.9.1-win32-x64.zip'
$checksum32 = 'cdd95a72164398e1fb7862cd0955e5121e1b09e97019dc480c818f78ac27a96b'
$checksum64 = 'd28e6d24ade6280e3997c96bd6a85a3699808bbf8dea95e7234ec5703bfba5d6'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
