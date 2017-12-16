
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://dl.ring.cx/windows/ring-windows-nightly-20171129113113~gitcf5bbff.exe'
$url64      = 'https://dl.ring.cx/windows/ring-windows-nightly_x86_64-20171129113113~gitcf5bbff.exe'
$checksum32 = '453f82d1fd09a59784134f41b7cc452b63016c94bd0e64981137acbab0288078'
$checksum64 = '93d89b76ae8184501cc6a012cae5cbecd05cbf804a0e041fde2cbb0bf7a2c5fa'

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
