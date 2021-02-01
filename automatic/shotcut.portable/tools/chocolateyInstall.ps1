$packageName = 'shotcut.portable'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v20.09.27/shotcut-win64-200927.zip'
$checksum64 = '31caf6ec3644877d12aeadd60e3dea65cf3fad29dc6a2bb2e33e7c8fbad6e711'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
