$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.35.5/Min-v1.35.5-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.35.5/Min-v1.35.5-windows.zip'
$checksum32 = '797b13dfa7673ca95c38245701eac8a98c39304b8b962d3546379bdac8422035'
$checksum64 = '743349ecde7d6b5a8c329f21e3ec848dcaf4751ccd1182023ccc7041763b25bd'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
