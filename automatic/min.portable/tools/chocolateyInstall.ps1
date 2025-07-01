$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.35.1/Min-v1.35.1-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.35.1/Min-v1.35.1-windows.zip'
$checksum32 = '030772804fcf0c05eb453f1fc8717dfa179901a3a62891f8e9e82954f9ee8ba7'
$checksum64 = '10e1608b5be6867baf7af8fc2a65dd7963088ec8a0dea1bae21d043c91557128'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
