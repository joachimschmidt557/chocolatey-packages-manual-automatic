$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.14.0/Min-v1.14.0-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.14.0/Min-v1.14.0-win32-x64.zip'
$checksum32 = '9ee63e6e9cf826fdaecfea6795a4e6a44c4cd2d34c6b586512d0a08fc2d91245'
$checksum64 = '7f585653940479a44640c51c882c856b9ee5ef3511494892f75fe59a28ec0d64'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
