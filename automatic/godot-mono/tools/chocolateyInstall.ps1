
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.6.2-rc2/Godot_v4.6.2-rc2_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.6.2-rc2/Godot_v4.6.2-rc2_mono_win64.zip'
$checksum32   = '9b190579252ef99c2100bc93dbba6bbcb4755ecf52e0af6be5b54c43f88f2619'
$checksum64   = 'be49b948e482ca3c18bb0a6bf0c9f89786dc4367780bcb3910aad7c571723174'

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
