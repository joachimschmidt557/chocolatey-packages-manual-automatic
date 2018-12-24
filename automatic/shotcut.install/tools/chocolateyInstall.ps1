
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.12.23/shotcut-win32-181223.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.12.23/shotcut-win64-181223.exe'
$checksum32 = 'e399908e5d264344e0026b0ff149bf4c0055f9aeb6cb18bc2bac82763f29c88e'
$checksum64 = '202bf50eb5952ff6644a704c59f96b9c4dc3817c58c091f09901c70d5dac99ee'

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
