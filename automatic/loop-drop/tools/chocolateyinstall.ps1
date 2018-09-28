
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.09.16/shotcut-win32-180916.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.09.16/shotcut-win64-180916.exe'
$checksum32 = 'e14c2f914284d638f4ca2e931e524963ac955da3f4aa14516f9a96611c7671bd'
$checksum64 = '45750aea65758239eaa0a1b1370e1262edaad278cce412ef6901b6a9165a5fd8'

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
