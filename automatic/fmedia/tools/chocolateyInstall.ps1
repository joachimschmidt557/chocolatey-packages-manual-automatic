$packageName = 'fmedia'
$url32      = 'http://fmedia.firmdev.com/fmedia-0.34.1-win-x64.zip'
$url64      = 'http://fmedia.firmdev.com/fmedia-0.34.1-win-x86.zip'
$checksum32 = '9ff54905303070f15eeb757ac23824a35d0de999fcd5286c27fe209d200eaff1'
$checksum64 = '9911a41bf7b9382bcd0db4dbd59b141d909e1039b93d8b3e1c2889ad32f5b8b2'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
