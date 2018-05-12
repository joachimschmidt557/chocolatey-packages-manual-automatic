$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v1.16/VNote_win_x86_portable_1.16.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v1.16/VNote_win_X64_portable_1.16.zip'
$checksum32 = '8eb327bd12be24024dcfaf3ec9d1ca524f9f80278c4e66f1ce49dced41d9d646'
$checksum64 = '1a2d8845c9c77bb98ceaa5ea633d93cfc8f473aeefec680e87e3f1b0535616f1'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
