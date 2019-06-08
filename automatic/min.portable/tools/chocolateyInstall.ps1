$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.10.1/Min-v1.10.1-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.10.1/Min-v1.10.1-win32-x64.zip'
$checksum32 = '342aecacddc86d4d7688b711130324e47f7f56ef1aed97cf03372da6df17ec50'
$checksum64 = '64a418bf4d961805f3b3b4b6edd628b9931458feed481c3dfa41ca5c875962af'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
