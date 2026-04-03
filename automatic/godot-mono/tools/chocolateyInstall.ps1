
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.6.2-stable/Godot_v4.6.2-stable_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.6.2-stable/Godot_v4.6.2-stable_mono_win64.zip'
$checksum32   = '34f5514b23bef859cb3dc772725c5d75ece53b4d5a45a0dac9c87c2c69e7f60c'
$checksum64   = '7c530d4b45d9f7aadd788b85a4d9dbdb5f2a239a72999afd7d29fda506fbedb6'

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
