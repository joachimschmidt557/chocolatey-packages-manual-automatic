
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$fileName   = 'mockoon.setup.9.7.0_x32.exe'
$fileLocation = Get-Item "$toolsDir\${fileName}"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file          = $fileLocation
  silentArgs    = "/S"
  validExitCodes= @(0)
  softwareName  = 'mockoon*'
}

Install-ChocolateyInstallPackage @packageArgs
