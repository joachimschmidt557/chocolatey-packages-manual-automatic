
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.7.2-rc1/Godot_v4.7.2-rc1_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.7.2-rc1/Godot_v4.7.2-rc1_mono_win64.zip'
$checksum32   = '4b3b4739eab507b891a3ef55f0515727f16aaa0c48944bfa628ea7374857d769'
$checksum64   = 'bcba97ce832f47acd556acf98d8494de4a8c9651a4d7e1f9bbfbd17d9cc654c7'

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
