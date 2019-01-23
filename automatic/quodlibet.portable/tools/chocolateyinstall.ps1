
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/quodlibet/quodlibet/releases/download/release-4.2.1/quodlibet-4.2.1-portable.exe'
$checksum   = '4c421bd314c2815ebbea399a393d797b2547b316418b9c674d30ab87470bb2cb'

Get-ChocolateyWebFile -PackageName 'quodlibet.portable' -FileFullPath "$toolsDir\QuodLibet.exe" -Url $url -Checksum $checksum -ChecksumType 'sha256'
