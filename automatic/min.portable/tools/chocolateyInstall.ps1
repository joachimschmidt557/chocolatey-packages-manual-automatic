$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.31.2/Min-v1.31.2-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.31.2/Min-v1.31.2-windows.zip'
$checksum32 = '7745130b403f5aa1de81d8061518698dac101976a809f57def2734da34768378'
$checksum64 = '5729bdc52e7f1e3bb2eb0ff6a94593c5b56eb68280a6422c2f913a012751bdb0'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
