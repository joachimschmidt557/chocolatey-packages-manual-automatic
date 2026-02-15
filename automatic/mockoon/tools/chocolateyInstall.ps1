
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$fileName   = 'phiola-2.7-beta5-windows-x64.zip'
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
