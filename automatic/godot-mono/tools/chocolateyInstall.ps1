
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.6.2-rc1/Godot_v4.6.2-rc1_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.6.2-rc1/Godot_v4.6.2-rc1_mono_win64.zip'
$checksum32   = '4e71aaa6900b11ea1f2d658fec5d46bd0aac3c2c05ecb40c3f803474c7649d7e'
$checksum64   = '940a2332707c8c73356d1b9b78281f85cba1f0c485d04ee75ffba97d921b5491'

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
