$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.34.1/Min-v1.34.1-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.34.1/Min-v1.34.1-windows.zip'
$checksum32 = '47d8095b119966147d966d6982fb3f3abe28adaee7ced017cdf422ad01b0d418'
$checksum64 = '2e58f7ac67ca859ceb011649942b885f01b9d8c96836067492b54e5576d3d262'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
