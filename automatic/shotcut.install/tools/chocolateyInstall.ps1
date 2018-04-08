
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.03/shotcut-win32-180306.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.03/shotcut-win64-180306.exe'
$checksum32 = '2032cd030ef94604c9ba5e0fc1bdb25666654a4a12ec8fdea2b06794c3a52b7d'
$checksum64 = 'b1f8eb7238e5e2ec83c5f150610ee8b6e2ac7e550c3d9504b458936e8b418417'

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
