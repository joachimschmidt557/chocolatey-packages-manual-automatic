$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.13.2/Min-v1.13.2-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.13.2/Min-v1.13.2-win32-x64.zip'
$checksum32 = 'e5b0dc39bc4619b31743f1c0fa7530751f6e44b326c9b6b4a6242274c3009fbb'
$checksum64 = '2e4d184a638bbd68181181412b179d43033e948bbc0ad71476aae627f2359905'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
