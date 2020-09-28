$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v20.09.27/shotcut-win32-200927.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v20.09.27/shotcut-win64-200927.zip'
$checksum32 = '7a4422c47e01ec899a5d3b8cd4230546ba549c73d626977dee5f82adac678c32'
$checksum64 = '31caf6ec3644877d12aeadd60e3dea65cf3fad29dc6a2bb2e33e7c8fbad6e711'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
