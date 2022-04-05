$packageName = 'sharpkeys.portable'
$url = 'https://github.com/randyrants/sharpkeys/releases/download/v3.9.4/sharpkeys394.zip'
$checksum = '06a40098214f1875b74b46a13d6a71728824bd5c8b946fd627014362f2001c07'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType"
