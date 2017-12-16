
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/IrosTheBeggar/mStream/releases/download/v3.2.0/mStreamExpress-installer-v0.6.exe'
$url64      = ''
$checksum32 = '94D653498B4F93B14F12A55CA06154E19C540C9B276E5D163F1CF84FA078F97A'
$checksum64 = 'DD9FD814CC44BC2FFA9B9E547B1A6CBB42B6BE7B9358542D3EE7F6E10B676423'

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
