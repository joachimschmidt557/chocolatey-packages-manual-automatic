$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.26.0/Min-v1.26.0-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.26.0/Min-v1.26.0-windows.zip'
$checksum32 = '2c2c338c0c49492d2943f478649350828677feb3eac249ea8123e04500cf1a8e'
$checksum64 = 'b3bf165f7e0b14e65c91b2d1ffb5a66e09b409b62b4dab6fb6c629e5aee98431'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
