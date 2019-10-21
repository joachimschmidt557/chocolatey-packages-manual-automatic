$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.10.20/shotcut-win32-191020.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.10.20/shotcut-win64-191020.zip'
$checksum32 = 'ac7a6c8df06e9f24310b56c8c9dd373450bb9c05d261781615c0b0d87abfc41d'
$checksum64 = 'f6a56c8ef1f115325b21abad3ab0a78351b4931031595eeb67d1b71433edf985'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
