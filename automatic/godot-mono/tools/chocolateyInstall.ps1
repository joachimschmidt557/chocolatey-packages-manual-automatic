
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$zipFile    = Get-Item "$toolsDir\*stable_mono_win32*.zip"
$zipFile64  = Get-Item "$toolsDir\*stable_mono_win64*.zip"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = $toolsDir
  filefullpath  = $zipFile
  filefullpath64= $zipFile64
}

Get-ChocolateyUnzip @packageArgs

# Make a nicer shim
$longFileName = Get-Item "$toolsDir\Godot*.exe"
Install-BinFile -Name "godot" -Path "$longFileName"

New-Item "$longFileName.ignore" -ItemType "file"
