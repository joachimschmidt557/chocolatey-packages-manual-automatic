
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.05/shotcut-win32-180503.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.05/shotcut-win64-180503.exe'
$checksum32 = 'ae4116a5512084f5ef4aa9e557e1639198cef498b25d3040ad2686ae546310e8'
$checksum64 = '5efbe7448e52206676dd9a195b8f06a5eb0389e9df23693edba5f234e2cf3b98'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32
  url64Bit      = $url64

  softwareName  = 'shotcut*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
