
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.7.1-rc2/Godot_v4.7.1-rc2_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.7.1-rc2/Godot_v4.7.1-rc2_mono_win64.zip'
$checksum32   = '3d0bc10231136cb377924193cf322fba2667afc47c90b55b44349f86ad422b6b'
$checksum64   = '2444a4ee1960c9f8d0f51c65acb5e62e3dbb5345b8aa19e4ed3b338e5691e06e'

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
