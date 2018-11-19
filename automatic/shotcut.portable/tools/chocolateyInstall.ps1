$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.11.18/shotcut-win32-181118.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.11.18/shotcut-win64-181118.zip'
$checksum32 = 'e506ed422790ae4ed2b0ab788eb95c0f64db487f0661cc4015651d77c2dadc38'
$checksum64 = 'a18480ceae4d641f1de8fae57d8a370c2a829dc2b19d0915d0e6e79d67f8ff07'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
