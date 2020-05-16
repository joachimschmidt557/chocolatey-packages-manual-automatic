$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.14.1/Min-v1.14.1-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.14.1/Min-v1.14.1-win32-x64.zip'
$checksum32 = 'edfececd6d723237dda05ccd6839eec6cceb1df87d5805b51bec345b37b765d2'
$checksum64 = 'f375aadd2e8798db7396727b46d29b6eb8b3b13b890ca266de39bd7ed942ea43'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
