$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.34.0/Min-v1.34.0-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.34.0/Min-v1.34.0-windows.zip'
$checksum32 = 'c4a454e656d24b6d61baa2569fa131df9dbade53f906cc218aa5715c9d4baa5f'
$checksum64 = 'd1797cc25b7274738792a713d215045c7abd87b5e0c11739a6d1b788fb984536'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
