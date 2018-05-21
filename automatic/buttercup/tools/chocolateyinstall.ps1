
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/buttercup/buttercup-desktop/releases/download/v1.7.0/buttercup-desktop-setup-1.7.0.exe'
$checksum   = 'bf35c4b6ab44a77072d21858b5fccec86e8c2c5b79173ca0cbc1d0c93a2966a4'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'buttercup*'

  checksum      = $checksum
  checksumType  = 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
