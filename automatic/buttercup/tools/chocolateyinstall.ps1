
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/buttercup/buttercup-desktop/releases/download/v1.18.0/Buttercup-Setup-1.18.0.exe'
$checksum   = '8125cfbe8b0f6f603ada53d2d9842136e90b859be411812332d660b4be6ab833'

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
