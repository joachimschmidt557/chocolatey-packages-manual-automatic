
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/IrosTheBeggar/mStream/releases/download/v4.1.2/mStreamExpress-Windows-x64-portable.zip'
$checksum   = '7a2eae9235c658bbe2ea711df6c389f509adb516e621ea6631a1cd52b6320f24'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url

  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
