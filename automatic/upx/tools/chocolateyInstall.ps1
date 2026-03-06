
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName32 = 'upx-5.1.1-win32_x32.zip'
$fileName64 = 'upx-5.1.1-win64_x64.zip'
$zipFile    = Get-Item "$toolsDir\${fileName32}"
$zipFile64  = Get-Item "$toolsDir\${fileName64}"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = $toolsDir
  filefullpath  = $zipFile
  filefullpath64= $zipFile64
}

Get-ChocolateyUnzip @packageArgs
