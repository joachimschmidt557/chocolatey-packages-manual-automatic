
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.08.14/shotcut-win32-180814.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.08.14/shotcut-win64-180814.exe'
$checksum32 = 'd9ad3847909488d11da6ed6f5e20699f7864d66400eec52851e05d15eb5684a5'
$checksum64 = 'acc32130234a0cff7539223517719cfbd5834fe13fb6a56fac1cad60c16f5006'

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
