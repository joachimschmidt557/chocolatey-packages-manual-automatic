
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.7.1-rc1/Godot_v4.7.1-rc1_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.7.1-rc1/Godot_v4.7.1-rc1_mono_win64.zip'
$checksum32   = 'f1113492fb61d97e284077c1065ed92ca688f3c9f7b5852df8af3e21057fbc49'
$checksum64   = '199c372014fb697ea9b588ab77595e0139d654a5d1591981ef24f9d244e59fe9'

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
