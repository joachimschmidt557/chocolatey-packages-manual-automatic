
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/PaitoAnderson/WallcatWindows/releases/download/1.0.4/Wallcat.exe'
$checksum   = '3e7d23a45986e60087b49adaed96568cc90efe6baa34616395e72c55c43dc3c2'

Get-ChocolateyWebFile -PackageName 'quodlibet.portable' -FileFullPath "$toolsDir\QuodLibet.exe" -Url $url -Checksum $checksum -ChecksumType 'sha256'
