
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName   = 'open-stage-control_1.30.1_win32-x64_x64.zip'
$zipFile64  = Get-Item "$toolsDir\${fileName}"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = $toolsDir
  filefullpath64= $zipFile64
}

Get-ChildItem $toolsDir\* | Where-Object { $_.PSISContainer } | Remove-Item -Recurse -Force #remove older package dirs
Get-ChocolateyUnzip @packageArgs
