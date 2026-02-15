
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.6.1-rc1/Godot_v4.6.1-rc1_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.6.1-rc1/Godot_v4.6.1-rc1_mono_win64.zip'
$checksum32   = '1e1305810bddc25af06a9da07aa1fae740446a22b89fa27339cf3d592328acf3'
$checksum64   = '13fafcc3e98ce1b7570f62cdaea229e5de948764c8c590b98840e8a3e09093ec'

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
