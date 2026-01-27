$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.35.3/Min-v1.35.3-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.35.3/Min-v1.35.3-windows.zip'
$checksum32 = '860ab3d008595dca5f674a5263cd4f6910b1a747ef9369849a3f67e95e2eda7b'
$checksum64 = 'c02883624e9a83f7d8b99cd4537de643ff1ca602bc454bdcb3ca0136e4178fd2'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
