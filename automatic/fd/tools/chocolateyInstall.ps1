$packageName = 'fd'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file32      = Get-Item "$toolsDir\*-i686-pc-windows-gnu.zip"
$file64      = Get-Item "$toolsDir\*-x86_64-pc-windows-gnu.zip"
$checksum32 = '864312a830a4a2e29d49aac1bb7c25ab55e223590406e79b8cbc5b16836e58e4'
$checksum64 = '074e280b3399aa2792cb3ae1fe20afab5f0465d69a07a694dbfbbbea2908211d'
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
