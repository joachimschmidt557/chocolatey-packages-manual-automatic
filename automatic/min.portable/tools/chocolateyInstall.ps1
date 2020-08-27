$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.16.0/Min-v1.16.0-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.16.0/Min-v1.16.0-win32-x64.zip'
$checksum32 = '0c08e936c15109e7bfe61085aae11c6a223a4079ed0f8f9f77d19197344dd5cc'
$checksum64 = '2d702209aff91a4d9e42ec3f9cec8b22c815e83b612854744b2909fd985a786a'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
