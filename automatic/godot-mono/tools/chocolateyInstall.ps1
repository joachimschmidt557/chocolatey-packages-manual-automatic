
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.6.3-rc2/Godot_v4.6.3-rc2_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.6.3-rc2/Godot_v4.6.3-rc2_mono_win64.zip'
$checksum32   = '1a72a09896bee00e46ac2e2916f6410fbc109166a13171f01c0f387cd3273969'
$checksum64   = 'b1f0fcd9af556ebf33262457d51bfdc3bad4c70343f38815eb3606e082b5f509'

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
