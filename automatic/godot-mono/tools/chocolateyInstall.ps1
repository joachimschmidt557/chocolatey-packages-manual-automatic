
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-dev2/Godot_v4.7-dev2_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-dev2/Godot_v4.7-dev2_mono_win64.zip'
$checksum32   = 'fa1c57f4bbc24ab0d2982cf5671cc6f408de560e30f4a4bab6cf10cd22d4775c'
$checksum64   = 'a3440e7c956c5b88d802563fdd1e4a685600cace86dd5065e4a7b9260a4cb917'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir

  url            = $url32
  url64bit       = $url64

  checksum       = $checksum32
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'
}

# Remove older Godot versions first
Get-Item "$toolsDir\Godot*.exe" | Remove-Item -Force

Install-ChocolateyZipPackage @packageArgs

# Make a nicer shim
$longFileName = Get-Item "$toolsDir\Godot*\Godot*.exe" | Select-Object -last 1
Install-BinFile -Name "godot" -Path "$longFileName"

New-Item "$longFileName.ignore" -ItemType "file"
