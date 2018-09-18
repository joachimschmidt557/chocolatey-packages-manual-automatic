$packageName = 'qpdf'
$url32      = 'https://github.com/qpdf/qpdf/releases/download/release-qpdf-8.2.1/qpdf-8.2.1-bin-mingw32.zip'
$url64      = 'https://github.com/qpdf/qpdf/releases/download/release-qpdf-8.2.1/qpdf-8.2.1-bin-mingw64.zip'
$checksum32 = 'e0383d84ca41028f441c793523109a394c8c45d9ebfe87836036f7e9fdfad39e'
$checksum64 = '75f35acdb36731886c33346468981796d8657849a8ae2e8b1016a1b46b13ea77'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
