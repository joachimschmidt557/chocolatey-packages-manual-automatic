$packageName = 'sharpkeys.portable'
$url = 'https://github.com/randyrants/sharpkeys/releases/download/v3.7/sharpkeys37.zip'
$checksum = '247349aae387714f5a1bdb52df0a2d9b90cb09c79a9f01e299cbc9249f33e0d9'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType"
