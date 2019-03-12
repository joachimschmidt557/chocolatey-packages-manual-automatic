$packageName = 'fmedia'
$url32      = 'http://fmedia.firmdev.com/fmedia-1.5-win-x64.zip'
$url64      = 'http://fmedia.firmdev.com/fmedia-1.5-win-x86.zip'
$checksum32 = 'c7b83f84dd16040ab2c2d9b7c8ba7ccaba6e1e0512a2c912774080f87781d4fb'
$checksum64 = '37e1a44fddbef22d5f923468a620ec1fdf512cd796af47e15bab9439b0e6d527'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
