$packageName = 'sharpkeys.portable'
$url = 'https://github.com/randyrants/sharpkeys/releases/download/v3.9.3/sharpkeys393.zip'
$checksum = '30ef2c64de819f2d544e995674baa39275c3910c5ba993a2fa169ded66ac3f93'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType"
