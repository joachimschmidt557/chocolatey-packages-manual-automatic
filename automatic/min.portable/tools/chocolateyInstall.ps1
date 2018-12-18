$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.8.1/Min-v1.8.1-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.8.1/Min-v1.8.1-win32-x64.zip'
$checksum32 = 'dfd40d1dd6bdaeeb3deac7d705009029778a0fbb7e5c366eaeec21310369b26b'
$checksum64 = '441e506aac395d3a73d7eb85bc286431285ce642dcd46386dc0f9cc7ace97e89'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
