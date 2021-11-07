$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.9.0/vnote-win-x86_v3.9.0.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.9.0/vnote-win-x64_v3.9.0.zip'
$checksum32 = '9aa950ab549a25c2684f3845dba323e0a5b91ad0366d05a59f4d4b957d7a7ef0'
$checksum64 = '4e4eac83de7ad9e63bab8e8c3d2531db3961e47b4b5432aef78ccc60be33c13d'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
