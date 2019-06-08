$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v2.6/VNote_win_x86_portable_2.6.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v2.6/VNote_win_X64_portable_2.6.zip'
$checksum32 = '387fd26d38585289b8bd5e39bfb023172e6ae317601f14fb083d5847f22e608f'
$checksum64 = 'd60769547472b9c275bd50385b8d36edf6dc5458c77bb6df86e9577b1a88eea2'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
