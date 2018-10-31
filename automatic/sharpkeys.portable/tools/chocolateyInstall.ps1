$packageName = 'sharpkeys.portable'
$url = 'https://github.com/randyrants/sharpkeys/releases/download/v3.8/sharpkeys38.zip'
$checksum = '3d7b22ff9a3d7abf90e8ef81c72bc328e561682bed1a03b1b574b88333c35956'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType"
