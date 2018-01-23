
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dl.ring.cx/windows/ring-windows-nightly-20180115143103~gitd0bda53.exe'
$url64      = 'https://dl.ring.cx/windows/ring-windows-nightly_x86_64-20180115143103~gitd0bda53.exe'
$checksum32 = '68f92b0740c9e0b78af690747e5435ea27ea5de3e3945b25db47bf45176d00c8'
$checksum64 = '573c15157028fc2701689bf079a4c0063f40baa8fdd57abde2267452b6d8e934'

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
