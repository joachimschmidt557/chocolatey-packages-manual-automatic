
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/buttercup/buttercup-desktop/releases/download/v1.17.3/Buttercup-Setup-1.17.3.exe'
$checksum   = 'cb52e994046ed99ba2e91259a61c6b97edfdf39a4afc120d9146ec1479d16ba2'

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
