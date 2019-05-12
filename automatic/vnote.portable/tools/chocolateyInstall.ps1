$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v2.5/VNote_win_x86_portable_2.5.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v2.5/VNote_win_X64_portable_2.5.zip'
$checksum32 = '881b22f7368f7e0824a47df3690665b0e1a8d12d205d5c56bd2734c21e0bb66c'
$checksum64 = 'cbb78cec615afcbecc1914f7a1661db56d14b585603b30b370d215a2cd0fe49e'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
