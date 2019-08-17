
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.08.16/shotcut-win32-190816.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.08.16/shotcut-win64-190816.exe'
$checksum32 = '54d48efb0f436290da0ed90d13c9839a65f99801aa4b6c72ee7dd778e1ea9abe'
$checksum64 = '668e37d1d5d9ed20ef46e965ae3804e80857c27820233e8a5f74f15e09967d81'

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
