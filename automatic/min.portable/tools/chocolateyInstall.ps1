$packageName = 'min.portable'
$url32      = 'https://github.com/sharkdp/fd/releases/download/v6.2.0/fd-v6.2.0-i686-pc-windows-gnu.zip'
$url64      = 'https://github.com/sharkdp/fd/releases/download/v6.2.0/fd-v6.2.0-x86_64-pc-windows-gnu.zip'
$checksum32 = '2ce7d1e4a03d33913cbb27867924ba90468aa98bd2669c38a474d52a6a5eb443'
$checksum64 = '58b46398b6f07455f3138332f470d90b4cdb11015789a8dc474e0d130c6dd889'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
