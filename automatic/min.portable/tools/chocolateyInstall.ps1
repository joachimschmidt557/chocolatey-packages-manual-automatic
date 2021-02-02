$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.18.0/Min-v1.18.0-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.18.0/Min-v1.18.0-win32-x64.zip'
$checksum32 = '639820fcc47de5376a20b0bcd1129dd3066c09304a3e74eea5507f95846e24dc'
$checksum64 = 'b2bd302ea915a08e67065d3710333ad61f60826df65242dac2a41137ec80b938'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
