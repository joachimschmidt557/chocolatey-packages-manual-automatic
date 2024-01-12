$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.31.0/Min-v1.31.0-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.31.0/Min-v1.31.0-windows.zip'
$checksum32 = 'cf018bd87e76bd076860304c64dcf8e726687f2654609ed462fa4893080ae672'
$checksum64 = '33c292a2ec131b0f7941f8ca8286e6e964af570cd06332baeaa7b8557457ea39'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
