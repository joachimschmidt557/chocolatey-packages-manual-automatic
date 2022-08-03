$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.14.0/vnote-win-x86_v3.14.0.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.14.0/vnote-win-x64_v3.14.0.zip'
$checksum32 = '7d3feac14e4fc5a36d82610d35458a89ca420017a042c2cf3027cb8b86d1ffb3'
$checksum64 = 'd92595bdd7490018edb61c369051480bea117aab53a23260bc868993c3cd0658'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
