$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.13.0/vnote-win-x86_v3.13.0.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.13.0/vnote-win-x64_v3.13.0.zip'
$checksum32 = '6b4b99634f2bb6f53e6c3c3b4f662bf27912138d2480024bf23d692606d7718a'
$checksum64 = 'f4d25b6a530838f823b92c0a902fa2b4ca957659b5c0cbd05d2d418cd1b77555'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
