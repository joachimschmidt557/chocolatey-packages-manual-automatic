$packageName = 'qpdf'
$url32      = 'https://github.com/qpdf/qpdf/releases/download/release-qpdf-8.0.2/qpdf-8.0.2-bin-mingw32.zip'
$url64      = 'https://github.com/qpdf/qpdf/releases/download/release-qpdf-8.0.2/qpdf-8.0.2-bin-mingw64.zip'
$checksum32 = ''
$checksum64 = ''
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
