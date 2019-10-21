
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.10.20/shotcut-win32-191020.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.10.20/shotcut-win64-191020.exe'
$checksum32 = '96479b9ad591fa188ba81d9794f8ae471e1c5ffe557d8e5d8addbe540d18eb84'
$checksum64 = '19d39d063399bae00ca91e8a9fac4e57b2cc2e276a3dd2e097d2eb1d07042286'

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
