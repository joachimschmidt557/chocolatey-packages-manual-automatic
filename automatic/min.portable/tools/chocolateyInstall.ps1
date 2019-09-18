$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.11.1/Min-v1.11.1-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.11.1/Min-v1.11.1-win32-x64.zip'
$checksum32 = '3646edc21765f55dcd30873eb4337bff222a9dca5013490f904eedb158d53750'
$checksum64 = 'a1d920d9debab2fc496f1e9cdd6e6d9a0fd558a9044084f6598e8078b60f870c'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
