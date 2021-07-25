$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.5.0/vnote-win-x86_v3.5.0.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.5.0/vnote-win-x64_v3.5.0.zip'
$checksum32 = 'ed923a73bafe0c2728bb31b8bdfc93ef0360d11b8a61ed4bb3f1206f89c990d4'
$checksum64 = 'f0cef612647f8468fa115452e53b79a7f87eb51259e5b9b4399531f84f754e10'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
