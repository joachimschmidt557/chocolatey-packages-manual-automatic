
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.8-dev7/Godot_v4.8-dev7_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.8-dev7/Godot_v4.8-dev7_mono_win64.zip'
$checksum32   = 'f44c489730d99f8e3baaac131d176ee72a23c9e09b4e2d9128f409228cf28718'
$checksum64   = 'f323707065ce30525b0d7d303b027552007d752e38fb802e9c0c7d42cc57d627'

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
