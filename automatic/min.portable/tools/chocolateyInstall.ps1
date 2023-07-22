$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.28.1/Min-v1.28.1-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.28.1/Min-v1.28.1-windows.zip'
$checksum32 = '40a9ae18a89db00a9d7b58cfe4b178bf46cbbdc03f907b5a109ed3c24137186c'
$checksum64 = '0d586da1bb344e74a2fdd21ab149c05bec826f5b7fc81e85ded79b7820adb6cd'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
