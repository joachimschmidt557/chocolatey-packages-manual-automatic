$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.07.15/shotcut-win32-190715.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.07.15/shotcut-win64-190715.zip'
$checksum32 = 'e04afb67f56ccd8738453501803617de68c7dd9f507d17e9ff750dd665e0c18c'
$checksum64 = 'fa435166b40d40855f2ec9f67fae7d82aa2628c534dce62d5398f2a82caa3e89'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
