
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/buttercup/buttercup-desktop/releases/download/v1.13.0/buttercup-desktop-setup-1.13.0.exe'
$checksum   = 'ad74982372f6da48abbdb5bd4afa8ad2b3446c221820649fe5d3a8fbeb662b96'

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
