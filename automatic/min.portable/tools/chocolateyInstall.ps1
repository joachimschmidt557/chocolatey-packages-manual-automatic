$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.11.2/Min-v1.11.2-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.11.2/Min-v1.11.2-win32-x64.zip'
$checksum32 = '7765efcc59fb134bc9bc5ba4cb85be4c54cdb2ff486d5a6ee165d374b8d98b75'
$checksum64 = '570022e32d30224b9a799c41dd1eb0c009e226afe9e86039db4802e4ed93c025'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
