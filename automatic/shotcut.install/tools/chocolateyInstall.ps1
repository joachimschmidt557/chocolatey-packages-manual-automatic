
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dl.ring.cx/windows/ring-windows-nightly-20180406193649~gitd732c04.exe'
$url64      = 'https://dl.ring.cx/windows/ring-windows-nightly_x86_64-20180406193649~gitd732c04.exe'
$checksum32 = '383c936d5b07c54de57c458b2a9875b8e25057045710423cba6c42171e9c187e'
$checksum64 = 'd3017fbe8f92c66accb70249bd0bf3d7f29f47f7b3b9c4b2caacf5c92bdf93d1'

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
