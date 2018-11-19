
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.11.18/shotcut-win32-181118.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.11.18/shotcut-win64-181118.exe'
$checksum32 = '99c26c087def9949a87812a31e1789bcb8459190ae43f86f17636f943f1a0f43'
$checksum64 = '6f73bf6e4ee32133299bcb6e0cbda1456db71a2633f421663edf699432110d86'

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
