
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-rc3/Godot_v4.7-rc3_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.7-rc3/Godot_v4.7-rc3_mono_win64.zip'
$checksum32   = '15a8d4c0591d8e5f2b446555ccd034f04e5193afb14c612fe183fd68cbc4eff7'
$checksum64   = 'e46828e9494c2436ecdadd728eada0f27afa85b6bb02cbe924baf0730a416596'

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
