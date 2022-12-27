$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.27.0/Min-v1.27.0-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.27.0/Min-v1.27.0-windows.zip'
$checksum32 = '55b221d02f2b61ffd19363facbabdf0331258456dab359c96de8863cca763576'
$checksum64 = 'a0c8c8580d5611c56a7bd234b3a9014bf4b424430b009f944bac78858756db41'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
