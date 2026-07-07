$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.35.6/Min-v1.35.6-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.35.6/Min-v1.35.6-windows.zip'
$checksum32 = '7b6fa0eedfa8544924a29e229993e08f9aaa3988908215d8547276e3572eee97'
$checksum64 = 'c91e387ed35270ae0127294660cf5d1110f654472d8d24514ef5cc79249a375b'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
