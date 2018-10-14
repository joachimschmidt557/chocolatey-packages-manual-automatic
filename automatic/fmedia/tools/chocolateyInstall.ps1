$packageName = 'fmedia'
$url32      = 'http://fmedia.firmdev.com/fmedia-1.1-win-x64.zip'
$url64      = 'http://fmedia.firmdev.com/fmedia-1.1-win-x86.zip'
$checksum32 = '05522d715dac36051a21ea78b076e495c9e3ab9d774b581c618f8ebc0133a662'
$checksum64 = '48ae42052bc256acbd679ae8b6bccf58f28c897b195e06be0a3486ca0e8eed3a'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
