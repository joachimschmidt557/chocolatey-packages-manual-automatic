$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.12.0/Min-v1.12.0-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.12.0/Min-v1.12.0-win32-x64.zip'
$checksum32 = '00a95f4d5a103c137ed06423c516dd255a37bf4aa70f9190bc977eac670e7b5e'
$checksum64 = 'baf03ea7f24d78f9cc5395c5ea8611c7f57426c4757082999d5ab28b0bf4fdf5'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
