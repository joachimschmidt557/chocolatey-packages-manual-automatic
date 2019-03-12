$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.02.28/shotcut-win32-190228.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.02.28/shotcut-win64-190228.zip'
$checksum32 = 'b8c2d88134f5b7cb32df7912ff5dfa35b15183f23cee983d041d0dcfb57a9bbd'
$checksum64 = 'f4ee089f507df9c7a7ccd12d24c8fc52a224113a8eaabaf4074a89cb14ed2f09'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
