$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v20.06.28/shotcut-win32-200628.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v20.06.28/shotcut-win64-200628.zip'
$checksum32 = '12bdf151acc3b442924fe35f762b50955108dae1347d521d8bc91f609aadeae4'
$checksum64 = 'a3cb967179f6ac265fa7c610ab8ea0f5e18ae83c56ba364ae0d7e7cfd3f3dc17'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
