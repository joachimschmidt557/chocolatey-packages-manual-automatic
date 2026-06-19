
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-stable/Godot_v4.7-stable_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-stable/Godot_v4.7-stable_mono_win64.zip'
$checksum32   = 'f983d071e630fcd517ef9b331fba44040dd001b0d316bcc229bfbef6af732b81'
$checksum64   = '73087f2ef4940be2c0bff358280053912182aca82b85891d6e42d9ebc5c26880'

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
