
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
  checksum      = '92db8764c6abb661e286e464562aa263985f499e166be0fa7943bbe4f2d000f2'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
