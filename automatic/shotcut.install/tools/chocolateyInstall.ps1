
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.01.27/shotcut-win32-190127.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.01.27/shotcut-win64-190127.exe'
$checksum32 = 'c1f6cb44ccab9606ca33c566ac1872e14751f7e4e0b2dc5f74185ca46cbc7710'
$checksum64 = '9a1e25359407db9bc34b2d4cedc026d195254fb9eb751e127307b8347fa5ee54'

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
