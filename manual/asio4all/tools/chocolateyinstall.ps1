
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.asio4all.org/downloads_11/ASIO4ALL_2_15_English.exe'
$checksum   = '15a3a1ff103f583f9e5493349c85b98799baadee44cb3f25a0611141a4a6d8fa'

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
