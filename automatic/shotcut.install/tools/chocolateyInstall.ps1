
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.09.13/shotcut-win32-180913.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.09.13/shotcut-win64-180913.exe'
$checksum32 = 'd31d1ff968a689a3c82c79f727a0c16440222ddccf02bb7f4795385f43492880'
$checksum64 = 'fb32f1a38a7833afd8efc76b950e380a1bb6bfb4bb7ccff2351ea134f003be9f'

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
