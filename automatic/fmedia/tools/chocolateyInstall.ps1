$packageName = 'fmedia'
$url32      = 'http://fmedia.firmdev.com/fmedia-1.0.1-win-x64.zip'
$url64      = 'http://fmedia.firmdev.com/fmedia-1.0.1-win-x86.zip'
$checksum32 = '69aa712447f191f1d476fb3eea0a5d0153237bc6aeec891321bdc3032c9d8952'
$checksum64 = '273234a43ad11b85e6929a969c122851978bc942066c6adc05ee9b46b6b723ff'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
