
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-rc2/Godot_v4.7-rc2_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-rc2/Godot_v4.7-rc2_mono_win64.zip'
$checksum32   = 'd354f77e3c5ac93b6472c04af9d264282c14b275e8c666a4f9c3998a51933929'
$checksum64   = 'cb0f2f130858cc46afb7fc26b6fbe969a8f270d386b2c0688fda6c865fa0564d'

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
