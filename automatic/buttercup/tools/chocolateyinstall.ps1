
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/buttercup/buttercup-desktop/releases/download/v1.10.3/buttercup-desktop-setup-1.10.3.exe'
$checksum   = 'f78456696078b29a07d01a0e682a5a0a1d3335c4e34100a178be21f090b4cf89'

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
