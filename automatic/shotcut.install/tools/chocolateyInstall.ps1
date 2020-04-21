
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v20.04.12/shotcut-win32-200412.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v20.04.12/shotcut-win64-200412.exe'
$checksum32 = '8d1ba9c3e5abd7c04ae0215516aa38e306e462ddd13b509f82134bc58b06fd95'
$checksum64 = '05dba3e892048a877dab229c58c75b74d836a6f1a65acf2c9e9ec9024b0556f6'

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
