
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.02.28/shotcut-win32-190228.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.02.28/shotcut-win64-190228.exe'
$checksum32 = '196a085e6d02d8c309706ef6db37e32974fbd9a91d2b0c5ce496bb5cc7976e56'
$checksum64 = '935e1068b561ad015c23eea659c60210db1ab1608e8be52f13c989e715b466fa'

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
