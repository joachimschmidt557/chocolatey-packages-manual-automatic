
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/IrosTheBeggar/mStream/releases/download/v5.1.16/mStream-Server-Setup-5.1.16.exe'
$checksum   = 'faee99627d6b7651b7faab1499d28528c0ffce8fbc6da218486b2cfecc99e30a'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'mstream*'

  checksum      = $checksum
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
