
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName32 = 'fd-v10.4.1-i686-pc-windows-msvc_x32.zip'
$fileName64 = 'fd-v10.4.1-x86_64-pc-windows-msvc_x64.zip'
$zipFile    = Get-Item "$toolsDir\${fileName32}"
$zipFile64  = Get-Item "$toolsDir\${fileName64}"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = $toolsDir
  filefullpath  = $zipFile
  filefullpath64= $zipFile64
}

Get-ChocolateyUnzip @packageArgs
