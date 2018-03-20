$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.7.1/Min-v1.7.1-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.7.1/Min-v1.7.1-win32-x64.zip'
$checksum32 = '8fa53acfa9e0d871d40216b9b13dac1909f7dac31afb9cc1ab9aa05088af53a2'
$checksum64 = 'dffad9066f190c8aaaebceebcda7ed71f7424098efb29ef45cc1217c4cbaf221'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
