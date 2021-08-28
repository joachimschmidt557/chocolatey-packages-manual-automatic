$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.7.0/vnote-win-x86_v3.7.0.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.7.0/vnote-win-x64_v3.7.0.zip'
$checksum32 = '7c45a32482716471e3772e80b576f7a7318f718796c5ef6825904bfff9cab517'
$checksum64 = 'f665f9c9532fae1fdc12c52f27ac7837b8073e53633e9261ff4d329e325f89fd'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
