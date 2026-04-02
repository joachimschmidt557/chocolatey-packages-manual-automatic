
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$fileName   = ''
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
