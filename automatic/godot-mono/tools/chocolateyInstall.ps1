
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/3.6.3-stable/Godot_v3.6.3-stable_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/3.6.3-stable/Godot_v3.6.3-stable_mono_win64.zip'
$checksum32   = '5e4dfc11c668e792a5ef4aec4471c7a09353d37b1998248ba8170f388908fc5b'
$checksum64   = 'fe086083378ee000b55f64e3e3017571d3a5d43dc5cf4c4bfade2f9c17cb5d28'

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
