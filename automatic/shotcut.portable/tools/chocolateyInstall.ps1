$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v20.09.13/shotcut-win32-200913.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v20.09.13/shotcut-win64-200913.zip'
$checksum32 = '109332934129bf487220ed42eb5d7917e264c923710e1e0e3925efe926a9d05c'
$checksum64 = '663bde2259133d579f12dc07c56580c1bb283cb360ede0933ef297b9916db951'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
