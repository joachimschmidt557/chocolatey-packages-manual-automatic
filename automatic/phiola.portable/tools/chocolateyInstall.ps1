
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName   = 'spek-0.8.5-beta.msi'
$zipFile64  = Get-Item "$toolsDir\${fileName}"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = $toolsDir
  filefullpath64= $zipFile64
}

Get-ChocolateyUnzip @packageArgs
