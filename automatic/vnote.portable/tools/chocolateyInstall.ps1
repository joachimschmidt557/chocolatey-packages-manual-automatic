$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.13.1/vnote-win-x86_v3.13.1.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.13.1/vnote-win-x64_v3.13.1.zip'
$checksum32 = '61676f43f407f75e059e78b501f73c2518321fe7092048ecc95e1e07f6abb284'
$checksum64 = 'ed65912a5756aaf484061e1c73e536c9ab7f185ddb8c2fd3160cb9dbc9e589df'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
