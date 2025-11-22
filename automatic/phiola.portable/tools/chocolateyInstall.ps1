
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName   = 'phiola-2.6-beta5-windows-x64.zip'
$zipFile64  = Get-Item "$toolsDir\${fileName}"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = $toolsDir
  filefullpath64= $zipFile64
}

Get-ChocolateyUnzip @packageArgs
