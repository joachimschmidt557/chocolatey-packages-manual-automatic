$packageName = 'fmedia'
$url32      = 'https://github.com/sharkdp/fd/releases/download/v6.3.0/fd-v6.3.0-i686-pc-windows-gnu.zip'
$url64      = 'https://github.com/sharkdp/fd/releases/download/v6.3.0/fd-v6.3.0-x86_64-pc-windows-gnu.zip'
$checksum32 = 'ab3686c842bfb64166c264ec55ed0d92ec14651689b82465d795cd9b8e5943f3'
$checksum64 = 'feaa46631d71f860316a6cdb6613a80ae4b8c04b44578505a81f9c70794ffd7b'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
