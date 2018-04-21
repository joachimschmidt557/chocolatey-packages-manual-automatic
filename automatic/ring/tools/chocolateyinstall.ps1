
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dl.ring.cx/windows/ring-windows-nightly-20180414194343~git2c51f89.exe'
$url64      = 'https://dl.ring.cx/windows/ring-windows-nightly_x86_64-20180414194343~git2c51f89.exe'
$checksum32 = 'cffa255842d1afebf58a5c2fa67104c8c68a39cd282580a96c2ab512772258bb'
$checksum64 = 'bf5225c9c1f3c1dca587ce61a88faf94b9d60294a54e2ac222a7d7204dcfc8ed'

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
