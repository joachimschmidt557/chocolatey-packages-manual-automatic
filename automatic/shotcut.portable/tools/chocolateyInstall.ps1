$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.06.15/shotcut-win32-190615.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.06.15/shotcut-win64-190615.zip'
$checksum32 = '97f7e7bd2585f17e04e3ea335a7a3dba129ba9d390ce8b74c0737614bed69231'
$checksum64 = '324b0f677a406ebf595ac9fd4ff55c6666a43a0e6c50b839581e7a0296af5ad9'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
