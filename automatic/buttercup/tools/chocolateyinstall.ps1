
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/buttercup/buttercup-desktop/releases/download/v2.25.0/Buttercup-win-x64-2.25.0-installer.exe'
$checksum64 = 'a8c2523d4a4fc5c82a32d1a078874bc2773d5823621e7de5508a32e60edcb604'

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
