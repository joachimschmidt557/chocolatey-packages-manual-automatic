$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.16.0/vnote-win-x86-qt5.15.2_v3.16.0.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.16.0/vnote-win-x64-qt5.15.2_v3.16.0.zip'
$checksum32 = 'c79fa5e84fbe2ebdd53d2d7a7343c94a8fa6e8e574943e898eba141db5190600'
$checksum64 = '4215518a97fd56db1337cc7d0513d01992591f7a0353c7362cc6711f83c98c76'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
