$packageName = 'upx'
$url = 'https://github.com/sharkdp/fd/releases/download/v6.2.0/fd-v6.2.0-i686-pc-windows-gnu.zip'
$checksum = '2ce7d1e4a03d33913cbb27867924ba90468aa98bd2669c38a474d52a6a5eb443'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType"
