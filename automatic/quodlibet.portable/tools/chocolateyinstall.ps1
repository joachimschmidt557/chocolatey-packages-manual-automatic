
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/quodlibet/quodlibet/releases/download/release-4.1.0/quodlibet-4.1.0-portable.exe'
$checksum   = '13C6007BB20329CACE4596651D09983F8C8CE5D37B2CAA4DC2837CAB4D088988'

Get-ChocolateyWebFile -PackageName 'quodlibet.portable' -FileFullPath "$toolsDir\QuodLibet.exe" -Url $url -Checksum $checksum -ChecksumType 'sha256'
