$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.30.0/Min-v1.30.0-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.30.0/Min-v1.30.0-windows.zip'
$checksum32 = '8e28c033c4a52f9e6f83a7e2769a840143121fb5162862d1f914368a5b8b5332'
$checksum64 = 'e7e19cd7367a29598184e62c251de9a3a1e6122a612f8d89919ab5b875c9df9c'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
