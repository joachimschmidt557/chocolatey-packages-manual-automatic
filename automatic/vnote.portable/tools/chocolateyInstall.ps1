$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.10.0/vnote-win-x86_v3.10.0.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.10.0/vnote-win-x64_v3.10.0.zip'
$checksum32 = 'df4e7eba8da98e6453ea388e576ab4bf485807e9b1100fbc155f2f77469404e1'
$checksum64 = '10342dd258ac89041f138fa836da41f3dcfeca8ab05398da0284a576c1e20ec9'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
