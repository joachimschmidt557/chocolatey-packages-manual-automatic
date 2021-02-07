$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.18.1/Min-v1.18.1-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.18.1/Min-v1.18.1-win32-x64.zip'
$checksum32 = 'cf35d04eda9ba10b0642b284c4119d41a95e4cd8bc26f80fb91490e7fce92883'
$checksum64 = '76a1899dfc35b8d8596e88c1c9becc6a8a64ac6aee7b7a87974177935ecd0279'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
