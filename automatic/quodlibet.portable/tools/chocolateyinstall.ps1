
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/quodlibet/quodlibet/releases/download/release-4.4.0/quodlibet-4.4.0-portable.exe'
$checksum   = '18435532275056b8567785d67fd1bb09344ed967e9a4841f8b125e5c0ac9fc4c'

Get-ChocolateyWebFile -PackageName 'quodlibet.portable' -FileFullPath "$toolsDir\QuodLibet.exe" -Url $url -Checksum $checksum -ChecksumType 'sha256'
