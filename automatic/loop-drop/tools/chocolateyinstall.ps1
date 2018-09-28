
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mmckegg/loop-drop-app/releases/download/v3.0.0/Loop.Drop.v3.0.0.msi'
$url64      = 'https://github.com/mmckegg/loop-drop-app/releases/download/v3.0.1/Loop.Drop.v3.0.1.x64.msi'
$checksum32 = '95cd28a1f66d59172a2a246a23531225ebc9c6f54a654d9bfcfd5fdba11120f1'
$checksum64 = '919b57580ed68ca700aec171a61a5b47c608a94ee15aefb81b51c118e3d903e8'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32
  url64Bit      = $url64

  softwareName  = 'loop drop*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs    = "/quiet /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
