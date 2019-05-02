$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.04.30/shotcut-win32-190430.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.04.30/shotcut-win64-190430.zip'
$checksum32 = 'eb1f0dfa4cfeffcda727590e65a02bb6e3b0c32e022412091b4eb333c6820715'
$checksum64 = '991c12aa2eadfc7d68fad49442629a7c8e11cf5e296eb0260fd4f704b0a5df35'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
