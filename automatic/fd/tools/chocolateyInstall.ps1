$packageName = 'fd'
$url32      = 'https://dl.ring.cx/windows/ring-windows-nightly-20180115143103~gitd0bda53.exe'
$url64      = 'https://dl.ring.cx/windows/ring-windows-nightly_x86_64-20180115143103~gitd0bda53.exe'
$checksum32 = '68f92b0740c9e0b78af690747e5435ea27ea5de3e3945b25db47bf45176d00c8'
$checksum64 = '573c15157028fc2701689bf079a4c0063f40baa8fdd57abde2267452b6d8e934'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
