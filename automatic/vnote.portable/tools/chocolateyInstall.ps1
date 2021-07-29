$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.5.1/vnote-win-x86_v3.5.1.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.5.1/vnote-win-x64_v3.5.1.zip'
$checksum32 = 'a7ab7f3acf75a0edec7b33db46823b7b9b3d59773ce80fe751631b4277354964'
$checksum64 = '0cceb3c54acf1726da8132084d9dabdd73ab73314fd337cbf97dbc2e478bbbab'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
