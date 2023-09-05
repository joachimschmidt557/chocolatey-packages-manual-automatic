$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.17.0/vnote-win-x86-qt5.15.2_v3.17.0.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.17.0/vnote-win-x64-qt5.15.2_v3.17.0.zip'
$checksum32 = '089449a95a448d07b879c0b74ff49687978d7da204d242714c8a69afc8a08cf1'
$checksum64 = 'a19ee888d4302f21f593ff3f043ff9966448996e5ae92e4142a7b435d5de3c98'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
