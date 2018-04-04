$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v1.14/VNote_win_x86_portable_1.14.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v1.14/VNote_win_X64_portable_1.14.zip'
$checksum32 = '5ceb237aae53c27af3bd931fe94fabeb1c481f4702743b28d0d12fc3956fa062'
$checksum64 = '39b6cbc4f2e9706d5cdcac36718e4b02952d2043cb5e192c58b6e12f9fe8c397'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
