
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.04.30/shotcut-win32-190430.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.04.30/shotcut-win64-190430.exe'
$checksum32 = '3189efe99305636380f586e4b2dc587c4026079934e3fbfc67fb4172f5ba2c0a'
$checksum64 = '1408d20fca1185243955aed7ed9c3aee5c9e141f9b4ed280b7b4b1cf36b87cf4'

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
