
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v20.09.13/shotcut-win32-200913.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v20.09.13/shotcut-win64-200913.exe'
$checksum32 = '206985f3069e158236bd456ef2886042597c7a1154ab43392f8bc458ad76d6c6'
$checksum64 = 'c4e98bd1d10eefa71988d1e4b7170e50991ad3949f6ce530c66deb14d2cdb5ec'

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
