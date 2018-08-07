$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.08/shotcut-win32-180801.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.08/shotcut-win64-180801.zip'
$checksum32 = 'eb8aecb9bceb1c68ec2d86dcaa504633b16e0eab2f02c76a547559e1ef502592'
$checksum64 = '3a4d28fe9c35b9bd19c5a7f428de76b578bd2efe32b47da00d05c87a2cf85897'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
