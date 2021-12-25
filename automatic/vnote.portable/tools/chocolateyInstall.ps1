$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/3.11.0/vnote-win-x86_v3.11.0.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/3.11.0/vnote-win-x64_v3.11.0.zip'
$checksum32 = '9bb32f68c74e9ed7957ffbe6e14bca345afb4fb22c829a970020e6ab5855a1fa'
$checksum64 = '9bf4b75954611ab60b10a802f1edeea6b3e6d0de16fc08d45794df421e131cf6'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
