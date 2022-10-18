$packageName = 'fmedia'
$url64      = 'https://github.com/stsaz/fmedia/releases/download/v1.29.1/fmedia-1.29.1-win-x64.zip'
$checksum64 = '1ac41fe48ebaf0d96445c4b18e46aa51a637b9c4aef643e3515f1e462a47ec0c'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
