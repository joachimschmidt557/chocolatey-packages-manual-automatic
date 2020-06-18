$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.15.0/Min-v1.15.0-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.15.0/Min-v1.15.0-win32-x64.zip'
$checksum32 = '8472fe934836446e2ade6605a7ecde4604d4bc0bfda3500cb1202788fc247adb'
$checksum64 = '609f96bfaebd48d81eda129edecf089d549b14c528382146767201183a6fce6a'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
