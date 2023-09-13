$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.29.0/Min-v1.29.0-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.29.0/Min-v1.29.0-windows.zip'
$checksum32 = '106d2a41359affad332054207bfcdff0feb25a7448c3cc3ab469ddeab4c08e7b'
$checksum64 = '47ef2de8f6369bf150e70a429b5d6e56883a904acd9b69589fd4a04e91882eeb'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
