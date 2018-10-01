
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Get-Item "$toolsDir\hyper-Setup-*.exe"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file          = $fileLocation
  silentArgs    = "--silent"
  validExitCodes= @(0)
  softwareName  = 'Hyper*'
}

Install-ChocolateyInstallPackage @packageArgs
