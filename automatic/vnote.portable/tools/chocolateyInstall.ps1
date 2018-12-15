$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v2.2/VNote_win_x86_portable_2.2.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v2.2/VNote_win_X64_portable_2.2.zip'
$checksum32 = 'ca7ae0d5b54745e9c4e73d19b14afdc189e272d7d87a8df44ab248031c893051'
$checksum64 = '4a746e970c3580ad85190d998ffbaa7ba2af575a4f5078ff11a9d3bb6453d2ff'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
