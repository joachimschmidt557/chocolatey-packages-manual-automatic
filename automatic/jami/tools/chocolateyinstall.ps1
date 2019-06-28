
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dl.ring.cx/windows/ring-windows-nightly-20180802183014~git14d8a66.exe'
$url64      = 'https://dl.ring.cx/windows/ring-windows-nightly_x86_64-20180802183014~git14d8a66.exe'
$checksum32 = '44c660f978d0e3ff45651194e60f40c5e9f49d2a919b03d00e768dbf63cc59ff'
$checksum64 = 'a4b095bb5f976cca09e3125f8f55f41a6845fbd9cf3bf85e30b398c0313e0045'

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
