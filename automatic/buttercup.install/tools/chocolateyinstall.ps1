
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version      = '2.28.1'
$fileLocation = Get-Item "$toolsDir\Buttercup-win-x64-${version}-installer.exe"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file          = $fileLocation

  softwareName  = 'buttercup*'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs
