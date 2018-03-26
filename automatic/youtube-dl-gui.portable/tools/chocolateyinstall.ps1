
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/MrS0m30n3/youtube-dl-gui/releases/download/0.4/youtube-dl-gui-0.4-win-portable.zip'
$checksum   = '5642d1ae53a6dba7a084d997ca76305e40b897e90b1f7a932e08d980ea1a2ba0'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url

  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
