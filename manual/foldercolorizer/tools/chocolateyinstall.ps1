
$ErrorActionPreference = 'Stop';

$packageName= 'foldercolorizer'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://softorino.com/foldercolorizer2/download/'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)

  softwareName  = 'folder colorizer*'
  checksum      = 'be93d35f03ebc8201662c6e46ca614e5d542dc6059ac47bdbe5646cc955cd933'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
