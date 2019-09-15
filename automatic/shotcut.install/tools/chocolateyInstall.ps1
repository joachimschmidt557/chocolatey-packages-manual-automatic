
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.09.14/shotcut-win32-190914.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.09.14/shotcut-win64-190914.exe'
$checksum32 = '96af97466a07bc6fc338f3ff11b4741b7f0a6f9446702f3a81ddc1bb32bcea20'
$checksum64 = '968f62a47fdfc71df550320b4417b612fe93c86c808dee2927b39a32e60ee28f'

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
