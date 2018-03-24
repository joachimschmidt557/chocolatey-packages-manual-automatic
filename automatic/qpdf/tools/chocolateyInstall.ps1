$packageName = 'qpdf'
$url32      = 'https://github.com/qpdf/qpdf/releases/download/release-qpdf-8.0.2/qpdf-8.0.2-bin-mingw32.zip'
$url64      = 'https://github.com/qpdf/qpdf/releases/download/release-qpdf-8.0.2/qpdf-8.0.2-bin-mingw64.zip'
$checksum32 = 'be2b3be37958d5582ba9565d5818b2e5bc7f8a392d5bc6d4c624113534b66766'
$checksum64 = 'c14420048e327899f006383b5a550f03fb3ccc7d2797155ec0d43846ba2ccea2'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
