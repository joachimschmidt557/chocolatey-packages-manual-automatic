$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.2.0/vnote-win-x86_v3.2.0.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.2.0/vnote-win-x64_v3.2.0.zip'
$checksum32 = '848fffb0d23e41026289e8b3922ce5ee8b483cb9993cd4324ec0b2dea4f84dd7'
$checksum64 = '35c80702d118795188b0b91fd84a831e0e130b06eea67480d20641c3ad67c485'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
