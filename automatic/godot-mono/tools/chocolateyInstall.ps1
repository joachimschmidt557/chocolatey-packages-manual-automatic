
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/godotengine/godot-builds/releases/download/4.8-dev2/Godot_v4.8-dev2_mono_win32.zip'
$url64 = 'https://github.com/godotengine/godot-builds/releases/download/4.8-dev2/Godot_v4.8-dev2_mono_win64.zip'
$checksum32   = 'd57429fb64deb47096c0bb0856e84f731939559c12b66ef60d9943e1270e2a41'
$checksum64   = '0ca444fc787d495f8828758cd21f2fe1feae7c7135ac84a1869f6aab8f317e2f'

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
