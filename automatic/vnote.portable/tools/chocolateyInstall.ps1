$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v2.0/VNote_win_x86_portable_2.0.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v2.0/VNote_win_X64_portable_2.0.zip'
$checksum32 = '2cd9ccbc573654cceaf624d7aad478386dff9f713e5fadbcc9777a4306f0ec85'
$checksum64 = 'e4acf3399d71477c2fc623f3494881c5e39d0617b0d6043b3d1f4799b1acac82'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
