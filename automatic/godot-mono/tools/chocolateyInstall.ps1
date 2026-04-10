
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-dev4/Godot_v4.7-dev4_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-dev4/Godot_v4.7-dev4_mono_win64.zip'
$checksum32   = '11836dac95e928381ebfe3b4677da1e6f9230771d3f9c8dc01c236102fd94c3b'
$checksum64   = 'e456dc4182927a70d47a6180c126b58cc0c76390306c7c55d32eae9366d1cbfc'

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
