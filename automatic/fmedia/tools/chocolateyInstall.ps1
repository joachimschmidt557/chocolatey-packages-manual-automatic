$packageName = 'fmedia'
$url32      = 'http://fmedia.firmdev.com/fmedia-1.2-win-x64.zip'
$url64      = 'http://fmedia.firmdev.com/fmedia-1.2-win-x86.zip'
$checksum32 = '122fa829c12deccb0e675d3f60bb2b8be6473873d632bbcb6f26b5a615680760'
$checksum64 = '89c459489269fe902ba5811ddb3d706d0f0531a3ac5df2a7efb39663948bbb32'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
