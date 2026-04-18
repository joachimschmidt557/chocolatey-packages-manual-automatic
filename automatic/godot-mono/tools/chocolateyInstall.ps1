
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-dev5/Godot_v4.7-dev5_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-dev5/Godot_v4.7-dev5_mono_win64.zip'
$checksum32   = 'd1a4d7ead36dbead6a88d20c5266e586ceba450bde48d626915d9be8f3d3fafb'
$checksum64   = '7f9cb0dd364341e7932b0163acb36d29ff87f8c0e9b72230f888e189decb1cfe'

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
