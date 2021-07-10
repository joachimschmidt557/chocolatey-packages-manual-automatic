$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.4.0/vnote-win-x86_v3.4.0.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.4.0/vnote-win-x64_v3.4.0.zip'
$checksum32 = '2f5a96e514a8f8f1b8aaa0dc4b305f6295a29fc42d1fb141d5816cb6f0087b34'
$checksum64 = '2fb185b67a2aa6169e53938ce9c793361c49f5da83cd61ea453ea569079073fe'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
