$packageName = 'fmedia'
$url64      = 'https://github.com/stsaz/fmedia/releases/download/v1.24.1/fmedia-1.24.1-win-x64.zip'
$checksum64 = '27fc321716cdd807d5c9ae9f2505bde03112de4b7ec3b8a9ccca7f57ca529ba1'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
