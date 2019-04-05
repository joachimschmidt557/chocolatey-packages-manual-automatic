$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/2.4/VNote_win_x86_portable_2.4.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/2.4/VNote_win_X64_portable_2.4.zip'
$checksum32 = 'b258fb08c81a8c9fc11b47c6163fd15d408af8a1bfa21eb8fbeab8297227fa56'
$checksum64 = 'c8982d826e6656ea7a718d06aa9a6ba3d7d1a0d0d952d32d28ff7cba504aaeaa'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
