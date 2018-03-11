
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://assets.windscribe.com/desktop/win/Windscribe.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'windscribe*'

  checksum      = 'ac690be3025a2dc0b664fbf1f79d85615258a73c1d362e35bc4ad18eae1b3ae3'
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /NODRIVER'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
