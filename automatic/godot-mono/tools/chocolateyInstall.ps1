
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.7.1-stable/Godot_v4.7.1-stable_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.7.1-stable/Godot_v4.7.1-stable_mono_win64.zip'
$checksum32   = 'eee10a399c1c924169487bdade80fab45de78b04e01a1ea18f345ec3e569ba92'
$checksum64   = '764a089809fb1a6f745686ce9f6d3ca83adce8fb60fb9a4e2324b63baaebaa45'

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
