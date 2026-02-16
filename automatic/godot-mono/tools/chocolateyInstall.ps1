
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-dev1/Godot_v4.7-dev1_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-dev1/Godot_v4.7-dev1_mono_win64.zip'
$checksum32   = '2aa34b04a5c3ea06d2eb686019ed978dce39bcbd27c34fb6f457f16b7ad797b0'
$checksum64   = '1d89ca912bb0b0d573db53f964c7107bff779bbbf281f5bb17353cb730a8031b'

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
