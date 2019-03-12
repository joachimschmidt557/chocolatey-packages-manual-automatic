
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://assets.windscribe.com/desktop/win/Windscribe.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'windscribe*'

  checksum      = '33B50CCD1C2596C592686DA0B3DFF0D8F00857F2643862A37C657CE40828F973'
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /NODRIVER'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
