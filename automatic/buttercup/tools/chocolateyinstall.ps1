
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/buttercup/buttercup-desktop/releases/download/v2.28.1/Buttercup-win-x64-2.28.1-installer.exe'
$checksum64 = 'f1f66b7a7bfeccc717402696c936b311b3983d5545606ef73102d2475ba6ba50'

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
