
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.8-dev3/Godot_v4.8-dev3_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.8-dev3/Godot_v4.8-dev3_mono_win64.zip'
$checksum32   = 'b664f6d4d92a3db9368c63e7f3cf705fbae57baa42dec7f100f2031628065e9c'
$checksum64   = 'c75619e700e6c94ffc774292eb065c58eaec91f7436a5e3bb7ec694b45b40346'

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
