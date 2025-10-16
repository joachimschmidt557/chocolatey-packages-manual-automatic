
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName32 = 'Godot_v4.5.1-stable_win32.exe_x32.zip'
$fileName64 = 'Godot_v4.5.1-stable_win64.exe_x64.zip'
$zipFile    = Get-Item "$toolsDir\${fileName32}"
$zipFile64  = Get-Item "$toolsDir\${fileName64}"

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
$longFileName = Get-Item "$toolsDir\Godot*.exe" | Select-Object -last 1
Install-BinFile -Name "godot" -Path "$longFileName"

New-Item "$longFileName.ignore" -ItemType "file"
