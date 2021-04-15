$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.19.2/Min-v1.19.2-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.19.2/Min-v1.19.2-win32-x64.zip'
$checksum32 = 'b924f3d3f31cc502fa82022b75632e1009d317a8c5eaf5ec01d3518571f07b81'
$checksum64 = 'e27d5f696293ad85e09d8aa95456b9cb35daa9d779cbced0bf4fb8598e71a0f1'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
