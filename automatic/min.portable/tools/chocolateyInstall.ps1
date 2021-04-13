$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.19.1/Min-v1.19.1-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.19.1/Min-v1.19.1-win32-x64.zip'
$checksum32 = '476f0a035037b41a67f6782a793533e78f01d6db33bd71a6e7f4438d7ea6112f'
$checksum64 = '3e729135090584565442fe14bd2a6b6203e569d4fbb3909cda1552849e0d179a'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
