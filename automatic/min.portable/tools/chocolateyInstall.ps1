$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.11.0/Min-v1.11.0-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.11.0/Min-v1.11.0-win32-x64.zip'
$checksum32 = '68e64abd5ff76b12d764c774765eab2fe8878c68d4af18f4f118e24275ba167d'
$checksum64 = '2599be9d3877a98b2329074f0f1ee46fbdb2582a4b01b00326e5f9b2cb73398e'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
