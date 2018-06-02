
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.06/shotcut-win32-180601.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.06/shotcut-win64-180601.exe'
$checksum32 = 'e8b04ec4323a4825ae13a1a9f4c03f5000e830681928bc68ef04f2b5e05fd9d1'
$checksum64 = '433cb565db7602ac536c841623b88e7c653c6c88f856a90f3140a6687f255b50'

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
