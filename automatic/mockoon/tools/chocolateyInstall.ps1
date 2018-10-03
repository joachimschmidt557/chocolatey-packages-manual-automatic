
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Get-Item "$toolsDir\mockoon*.exe"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file          = $fileLocation
  silentArgs    = "/S"
  validExitCodes= @(0)
  softwareName  = 'mockoon*'
}

Install-ChocolateyInstallPackage @packageArgs
