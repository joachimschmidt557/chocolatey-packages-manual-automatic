
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.8-dev4/Godot_v4.8-dev4_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.8-dev4/Godot_v4.8-dev4_mono_win64.zip'
$checksum32   = '01bbed584f9e02e6c4d4069f9a15029c445246ae3952310a4789b2ba8aea07b2'
$checksum64   = '9e7fe3727af215fb3ddfac857bc033df360adf1a79f4f36c20b5e8ae03b095ca'

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
