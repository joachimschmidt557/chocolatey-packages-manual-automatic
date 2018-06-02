$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v1.17/VNote_win_x86_portable_1.17.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v1.17/VNote_win_X64_portable_1.17.zip'
$checksum32 = '22c3893f3aa696541de922a7faf708195d9342839d95bd6896d54320e7d9f760'
$checksum64 = 'd45a031105a6a5dcecd43e6049274e9ae62f6cc955371b9193e596f7190ccef1'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
