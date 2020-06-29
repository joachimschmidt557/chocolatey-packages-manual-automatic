
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v20.06.28/shotcut-win32-200628.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v20.06.28/shotcut-win64-200628.exe'
$checksum32 = 'cf3bb6301a99c7839125729327c98b67a330268bdd0a50ea40dd47c03c7bd949'
$checksum64 = '4763307c5dbdc3b8bb9598062cf7f4dff8ecf777bfc987000f76ff061b9af370'

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
