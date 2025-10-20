$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.35.2/Min-v1.35.2-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.35.2/Min-v1.35.2-windows.zip'
$checksum32 = '1f76a50cac40c859058e284c788253b53e91950b69f2864887193a61ca0a2f17'
$checksum64 = 'e18bd310e25da7b3f2176cfeefc97cfa7e9aae4739885aac577a2ed7d2469a14'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
