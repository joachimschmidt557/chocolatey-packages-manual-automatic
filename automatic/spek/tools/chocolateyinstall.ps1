
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName     = 'spek'
$fileLocation = Get-Item "$toolsDir\${fileName}"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'

  softwareName  = 'resonic*'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs
