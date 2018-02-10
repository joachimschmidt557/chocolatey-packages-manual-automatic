
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dl.ring.cx/windows/ring-windows-nightly-20180209181145~git830d387.exe'
$url64      = 'https://dl.ring.cx/windows/ring-windows-nightly_x86_64-20180209181145~git830d387.exe'
$checksum32 = 'e21dc2d347c0d6d50d8c946a2d45473730a88cd0941c182a0c27868a003e75dd'
$checksum64 = '11839ed9cc6f9082c2b4ee4d2aacbabb47f63c0fcc2d866a65f613e6a2c31efd'

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
