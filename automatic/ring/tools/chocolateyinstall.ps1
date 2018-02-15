
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dl.ring.cx/windows/ring-windows-nightly-20180214101523~git5bd95ff.exe'
$url64      = 'https://dl.ring.cx/windows/ring-windows-nightly_x86_64-20180214101523~git5bd95ff.exe'
$checksum32 = 'a5de4fdd864e57fb20e72cb875ae56a1b42b3faa77fdbe0d9e3da8cc29dcd835'
$checksum64 = '8feff72e1f8a8729bbc9a77c2b82c5fa0ecaba580028a50585c81d381b10fa4f'

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
