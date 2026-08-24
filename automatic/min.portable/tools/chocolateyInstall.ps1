$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.35.7/Min-v1.35.7-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.35.7/Min-v1.35.7-windows.zip'
$checksum32 = '006cc08184f1d5582268804a87e81e811792270c51e68a37aef8123dd9f1cde3'
$checksum64 = '6659766134e4d45bd75ac385390b02cea8284a58b37a9f60af2e193a9e04b3d5'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
