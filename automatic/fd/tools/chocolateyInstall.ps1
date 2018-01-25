$packageName = 'upx'
$url = 'https://github.com/upx/upx/releases/download/v3.94/upx394w.zip'
$checksum = '74308DB1183436576D011BFCC3E7C99C836FB052DE7B7EB0539026366453D6E8'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType"