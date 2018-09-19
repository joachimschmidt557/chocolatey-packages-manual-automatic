
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://assets.windscribe.com/desktop/win/Windscribe.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'windscribe*'

  checksum      = 'A2C83B12B7C3A3E9879E95D2863266E644FD62E7532F28B0F472C34EE515A5C3'
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /NODRIVER'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
