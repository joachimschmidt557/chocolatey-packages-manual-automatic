
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.asio4all.org/downloads_11/ASIO4ALL_2_15_English.exe'
$checksum   = '74dfe576c6f16e362ff2d44c313947aad9d63ed839b4d3ffac88a1320a486b90'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'asio4all*'

  checksum      = $checksum
  checksumType  = 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
