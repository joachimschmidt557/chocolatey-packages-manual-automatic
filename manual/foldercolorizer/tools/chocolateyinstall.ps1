
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
  checksum      = 'B34BA76A482B4410F29177E23F359BBFB6DA2EB8F670A4A378554947D9AFF535'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
