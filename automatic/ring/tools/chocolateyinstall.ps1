
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dl.ring.cx/windows/ring-windows-nightly-20180201172049~git1c179b2.exe'
$url64      = 'https://dl.ring.cx/windows/ring-windows-nightly_x86_64-20180201172049~git1c179b2.exe'
$checksum32 = '1d02351c192de0d7119ee2e48757e0748e897915c4ea49624924d26aef2bfe74'
$checksum64 = 'ba124e5d428e4062dff299602f3fe199991d8c0c04aaf4596dd7e69b987d8956'

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
