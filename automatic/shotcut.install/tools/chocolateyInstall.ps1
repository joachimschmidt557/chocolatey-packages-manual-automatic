
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v20.04.12/shotcut-win32-200412.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v20.04.12/shotcut-win64-200412.exe'
$checksum32 = '1522e087e92622f99b4bf6329c3eacf8cda01df5489bed7a00d221565595c4ba'
$checksum64 = 'aee5296a78365ba09ffcfcf0ac5523e62b7062d1f288c53363c6f71ffaa38a8c'

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
