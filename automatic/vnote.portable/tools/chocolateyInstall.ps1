$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v2.7.1/VNote_win_x86_portable_2.7.1.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v2.7.1/VNote_win_X64_portable_2.7.1.zip'
$checksum32 = 'c3b0abeb7d7f927ca27a7763107d10d2c3063ee91e0a09f215a35b0fd52cd259'
$checksum64 = '9177276d69e2b2fb151fe756c84ec4560036011ef55ed240110375f3913688ef'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
