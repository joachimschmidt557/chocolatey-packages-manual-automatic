
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.8-dev6/Godot_v4.8-dev6_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.8-dev6/Godot_v4.8-dev6_mono_win64.zip'
$checksum32   = 'bc06a6fea05d9764d3aca0cf21df0acc2da1a28fbcc8b132ab6590f611e0d507'
$checksum64   = '0642d39681dbebb2e5965924f58bc7e56058096750678b1d50f9eba941324da5'

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
