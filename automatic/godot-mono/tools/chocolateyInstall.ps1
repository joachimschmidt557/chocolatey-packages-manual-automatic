
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.5.2-stable/Godot_v4.5.2-stable_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.5.2-stable/Godot_v4.5.2-stable_mono_win64.zip'
$checksum32   = 'a91bf46857811643a4e57bf15d87f7bbae5b599ae07d1bf8567f349f014fcf1e'
$checksum64   = '1d7062418ae29cbd29f5f1ad95e6f13f8ac6cb2d6effd673d3be1b3398380887'

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
