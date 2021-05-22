$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.1.0/vnote-win-x86_v3.1.0.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.1.0/vnote-win-x64_v3.1.0.zip'
$checksum32 = '120fb89ca1533ad2d05d5c109b576d647421e0b2a0ca96c423397b4940b3e6d8'
$checksum64 = 'ea7dd179bc8422a8c4f1ce1b0b8f61ac293c0cbc1c74b94de532377aac1c6fa4'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
