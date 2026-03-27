
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-dev3/Godot_v4.7-dev3_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-dev3/Godot_v4.7-dev3_mono_win64.zip'
$checksum32   = 'a07623f8822dc5d8c199dda594629d322d6fc488280210618bfb9ab8638ab036'
$checksum64   = '2d439741f3117fa32eb975c1fd57fb08128599b127ec9003468592907ab4b362'

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
