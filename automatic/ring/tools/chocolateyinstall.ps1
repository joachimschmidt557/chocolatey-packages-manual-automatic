
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dl.ring.cx/windows/ring-windows-nightly-20180509175859~gitdf8550e.exe'
$url64      = 'https://dl.ring.cx/windows/ring-windows-nightly_x86_64-20180509175859~gitdf8550e.exe'
$checksum32 = '658a450a25b73cc6f48be79bee1b5e5fb85ba586f9deaf08834a5584d807b017'
$checksum64 = 'df37e8a5d31e8a4b5c012b7162400879a85a6f405d5cc1621c634603284c8d5c'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32
  url64Bit      = $url64

  softwareName  = 'ring*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
