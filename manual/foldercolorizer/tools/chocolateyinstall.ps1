
$ErrorActionPreference = 'Stop';

$packageName= 'foldercolorizer'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.softorino.com/folco/last/'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)

  softwareName  = 'folder colorizer*'
  checksum      = '26B3E394C9164BC761F0C3950D380060B0F27772ECD1A835E2A5161F676B593F'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
