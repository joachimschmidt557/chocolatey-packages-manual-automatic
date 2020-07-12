
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v20.07.11/shotcut-win32-200711.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v20.07.11/shotcut-win64-200711.exe'
$checksum32 = 'e6d44c4248d6a6f0585e5f2e10f0dbfc9d52617248c031ca7170dab0b2c5fa64'
$checksum64 = '1e924933ff0c3067512171ccb08b033c46dbcdfa1921ba686f332cb9aedbbb87'

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
