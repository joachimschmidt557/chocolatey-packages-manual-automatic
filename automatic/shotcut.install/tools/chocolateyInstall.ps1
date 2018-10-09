
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.10.08/shotcut-win32-181008.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.10.08/shotcut-win64-181008.exe'
$checksum32 = '64fb3a0b8ed1c26012d40c1f6f33a7d885344ff46d087f95f866a0df6236f7ed'
$checksum64 = 'd1eb889f21a49a1e40663a6d6095920cf3d984258f2b0b891489c30197dcdb4c'

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
