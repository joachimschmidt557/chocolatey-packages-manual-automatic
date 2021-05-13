$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.0.1/vnote-win-x86_v3.0.1.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.0.1/vnote-win-x64_v3.0.1.zip'
$checksum32 = 'db64e76ddf07f40920bdf28f0a3f63f9a6a5d94bc0eec50a13e93c4cc70f17d0'
$checksum64 = 'd0db70fe61643c5b091fdedf5f86d70856ca6c138da25f62e1c6a32bb2bff564'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
