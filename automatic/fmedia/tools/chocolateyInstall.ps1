$packageName = 'fmedia'
$url32      = 'http://fmedia.firmdev.com/fmedia-1.4-win-x64.zip'
$url64      = 'http://fmedia.firmdev.com/fmedia-1.3-win-x86.zip'
$checksum32 = 'af59371c57364d4a5e56f808b387343f64916d773c48690d9c0259b63755b2ee'
$checksum64 = '410e1cc8a801aa1e497504ae24a059df1bc8b50c5179bc097f79c39e2b292949'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
