
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dl.ring.cx/windows/ring-windows-nightly-20180717115705~git957acac.exe'
$url64      = 'https://dl.ring.cx/windows/ring-windows-nightly_x86_64-20180717115705~git957acac.exe'
$checksum32 = '11b99c77b74794c81f4a7c7831b5facab0598e8ee0f2fdfacc22eb5aad792509'
$checksum64 = 'd9a641893f5f50fb15fd1d6577941ce877e3138d1f15e509274163bc7d5e9941'

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
