$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.17.3/Min-v1.17.3-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.17.3/Min-v1.17.3-win32-x64.zip'
$checksum32 = 'ee85305e43c24a817accce3dcb68036231516d66943abbb98867e9955cb4c132'
$checksum64 = '7a6c8c95de05b59446b821066e0a12b441d262f77ac9fd8324031175f3ec967e'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
