
$ErrorActionPreference = 'Stop';
$pp = Get-PackageParameters

$installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
if ( $pp.InstallDir ) {
  $installDir = $pp.InstallDir
}

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName   = 'phiola-2.7-beta5-windows-x64.zip'
$zipFile  = Get-Item "$toolsDir\${fileName}"
#$zipFile64  = Get-Item "$toolsDir\*-x86_64-pc-windows-gnu*.zip"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = $installDir
  filefullpath  = $zipFile
  #filefullpath64= $zipFile64
}

Get-ChocolateyUnzip @packageArgs
Write-Host "Installed to: '$installDir'"
