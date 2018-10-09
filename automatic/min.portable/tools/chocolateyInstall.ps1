$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.8.0/Min-v1.8.0-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.8.0/Min-v1.8.0-win32-x64.zip'
$checksum32 = '422f27b06e40317555ef7edf022279b86a1e75e757a475f1cf1b27aa4c760db6'
$checksum64 = '6f852b0977e32952ff24a3488e9bbeb3271ed511a50305280508c6838f3258ef'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
