$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.3.0/vnote-win-x86_v3.3.0.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.3.0/vnote-win-x64_v3.3.0.zip'
$checksum32 = '02a50f9295d3358093365cdd33af33d1134845eef9be37fce35d2d13b3dc8bad'
$checksum64 = 'bdac323af44dc79aa39582e1c29d20a903b92490c0432ad62012115c452b1819'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
