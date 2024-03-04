
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/buttercup/buttercup-desktop/releases/download/v2.26.0/Buttercup-win-x64-2.26.0-installer.exe'
$checksum64 = 'd70421d4fd4c83e834522ccb1e839a049d59c89b48367bd4dc6bd52a8815d96e'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64Bit      = $url64

  softwareName  = 'buttercup*'

  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
