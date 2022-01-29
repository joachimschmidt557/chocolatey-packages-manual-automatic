$packageName = 'fmedia'
$url64      = 'https://github.com/stsaz/fmedia/releases/download/v1.25.3beta/fmedia-1.25.3beta-win-x64.zip'
$checksum64 = 'bbbba66c72f967eb039fdb9a7e77ae02361a6e9aa7cbaa69a55e5107d971f80d'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
