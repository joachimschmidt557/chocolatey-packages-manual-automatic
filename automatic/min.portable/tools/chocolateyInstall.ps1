$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.31.1/Min-v1.31.1-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.31.1/Min-v1.31.1-windows.zip'
$checksum32 = '396faf0b045a677ae5d1e7bfa0cc48534b4d9e645b211449fda8b19108837620'
$checksum64 = '029586b7131178aabdd89d01408f01402683d665f074c726109d70a801fa73e4'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
