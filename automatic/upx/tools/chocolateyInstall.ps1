
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$zipFile    = Get-Item "$toolsDir\upx*.zip"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = $toolsDir
  filefullpath  = $zipFile
}

Get-ChocolateyUnzip @packageArgs
