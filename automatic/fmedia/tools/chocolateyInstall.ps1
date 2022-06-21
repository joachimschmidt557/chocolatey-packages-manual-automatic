$packageName = 'fmedia'
$url64      = 'https://github.com/stsaz/fmedia/releases/download/v1.28/fmedia-1.28-win-x64.zip'
$checksum64 = 'db4febfdbfc3bf1379a113404e3491dad03464c0e450b142bbc2f511e9200528'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
