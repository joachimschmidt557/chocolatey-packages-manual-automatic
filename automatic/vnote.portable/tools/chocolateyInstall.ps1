$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.12.0/vnote-win-x86_v3.12.0.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.12.0/vnote-win-x64_v3.12.0.zip'
$checksum32 = '5916e93ee6a3dc2d8cf1931c3439ecb33927c967bdf051d7423c3dfb7d024659'
$checksum64 = '023e5b782b575de244acbda2a3af4905fcc571fb3ebdfb67bddff16255b6c061'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
