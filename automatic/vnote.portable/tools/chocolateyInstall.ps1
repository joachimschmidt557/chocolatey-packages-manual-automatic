$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v1.13/VNote_win_x86_portable_1.13.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v1.13/VNote_win_X64_portable_1.13.zip'
$checksum32 = '39366305f3e2b7bf6707443f506ef12d6d28d02df137c10bb81d076905da4592'
$checksum64 = 'b70f196b346c2d43600c5f4678de866f9b984427702187f36771993517b2bb6e'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
