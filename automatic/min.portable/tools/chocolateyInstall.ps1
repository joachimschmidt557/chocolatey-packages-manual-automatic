$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.33.0/Min-v1.33.0-windows-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.33.0/Min-v1.33.0-windows.zip'
$checksum32 = 'ef428820a1bc3d72edc5006a3e6a1e547b951c3520f41e248832ad470bf62877'
$checksum64 = 'd2b59e3e433aa6255362b4a4cbc346ac457892377a6118de53771592c254db5f'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
