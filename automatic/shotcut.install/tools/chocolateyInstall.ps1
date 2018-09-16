
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.09.15/shotcut-win32-180915.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.09.15/shotcut-win64-180915.exe'
$checksum32 = '65ed31a954368d11e6d38ed580b197f4e61cadca4012fb7b8a0ef155b188f615'
$checksum64 = 'cf68f56cafaf14d6e748c80e34acdc36380f81208e675e2a35d1b608aa3b2ad1'

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
