
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$zipFile    = Get-Item "$toolsDir\*stable_win32*.zip"
$zipFile64  = Get-Item "$toolsDir\*stable_win64*.zip"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = $toolsDir
  filefullpath  = $zipFile
  filefullpath64= $zipFile64
}

# Remove older Godot versions first
Get-Item "$toolsDir\Godot*.exe" | Remove-Item -Force

Get-ChocolateyUnzip @packageArgs

# Make a nicer shim
$longFileName = Get-Item "$toolsDir\Godot*.exe"
Install-BinFile -Name "godot" -Path "$longFileName"

New-Item "$longFileName.ignore" -ItemType "file"
