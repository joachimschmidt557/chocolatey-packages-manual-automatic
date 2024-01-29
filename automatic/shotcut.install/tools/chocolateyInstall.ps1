
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v24.01.28/shotcut-win64-240128.exe'
$checksum64 = '599bdd616f406394f56f6f5607d0ef392edf807290d1deef3b07c8195aea1e27'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64Bit      = $url64

  softwareName  = 'shotcut*'

  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
