$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.07/shotcut-win32-180702.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.07/shotcut-win64-180702.zip'
$checksum32 = '2a1b84016073e7f65bdf1d5d18115ef0daa20628769b445035bbbecbdcb3100c'
$checksum64 = 'e111dec300d191f5b4d6cb3cd0df71a2b9b128a352687caf018fda9fc47ed908'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
