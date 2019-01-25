$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.01.24/shotcut-win32-190124.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.01.24/shotcut-win64-190124.zip'
$checksum32 = '1c235a013b8349ee046760cfcaee0b2cb9db0ea483b576d14247562ec2a35ced'
$checksum64 = '7e21bf87ed16e56f7d458f495879a1a9f60b305161cab9439da786493e787bef'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
