$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v20.07.11/shotcut-win32-200711.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v20.07.11/shotcut-win64-200711.zip'
$checksum32 = 'e0859bd7ec92a04f69178bc391ec88738b9e565a59f14411ceda3b9874931c16'
$checksum64 = '042af3256eebf343cf58f839bb4db06323130c97f6d0f0074491e6f69cba02b3'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
