
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.11.13/shotcut-win32-181113.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.11.13/shotcut-win64-181113.exe'
$checksum32 = '6eb0aea8cf185b178637b74970b54c20e0d450daa5ba3810de0cd0d6feef05fe'
$checksum64 = '6fc4d37563043cc1be224f490bf434c42f99574c7ddd54fff5348602c1005aa4'

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
