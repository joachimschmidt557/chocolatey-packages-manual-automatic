
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dl.ring.cx/windows/ring-windows-nightly-20180407170847~git93c42ff.exe'
$url64      = 'https://dl.ring.cx/windows/ring-windows-nightly_x86_64-20180407170847~git93c42ff.exe'
$checksum32 = '2dffd656afad94cf0b4fffa840d1141f4b882d46b6dec1b1974eef8deaf21926'
$checksum64 = 'f8242d8e1d071dc5f03c857c646656ed839c2c93731d9d946ed31e37f2df8b02'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32
  url64Bit      = $url64

  softwareName  = 'ring*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
