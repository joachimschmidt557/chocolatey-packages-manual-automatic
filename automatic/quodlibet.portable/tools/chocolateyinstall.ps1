
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/quodlibet/quodlibet/releases/download/release-4.0.2/quodlibet-4.0.2-installer.exe'
$checksum   = '588477831ce3f0ddbd812058050d31130ca3d1f468a91da5fed6cfa208320513'

Get-ChocolateyWebFile -PackageName 'quodlibet.portable' -FileFullPath "$toolsDir\QuodLibet.exe" -Url $url -Checksum $checksum -ChecksumType 'sha256'
