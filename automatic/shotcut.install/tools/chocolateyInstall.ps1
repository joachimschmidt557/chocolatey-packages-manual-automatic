
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.01.24/shotcut-win32-190124.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.01.24/shotcut-win64-190124.exe'
$checksum32 = 'd7a9227b9ef4be00d94cc4e71e66bbaa6ece3fec6fcf3fcc3e88dbd87e98267c'
$checksum64 = 'd2b637ee0054ee95656a501144e9a73be6e19483af490b121069d5875c5b44eb'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32
  url64Bit      = $url64

  softwareName  = 'shotcut*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
