$packageName = 'fmedia'
$url64      = 'https://github.com/stsaz/fmedia/releases/download/v1.27.3/fmedia-1.27.3-win-x64.zip'
$checksum64 = '21008cbc0e1df9f3ecc68e4069f9ec313cd3dcee958d2271da937349be65937e'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
