
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-rc1/Godot_v4.7-rc1_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-rc1/Godot_v4.7-rc1_mono_win64.zip'
$checksum32   = '0dd1858f2b242ab76ffeed2498bc4b8cde2a801857b5bf81c544da9b54ac9ebf'
$checksum64   = '85978e01167bf2ce1f3326952f3f0add616f02a62784ec0f36fa738d49906bf2'

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
