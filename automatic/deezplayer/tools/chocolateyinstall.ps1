
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/imanel/DeezPlayer/releases/download/v2.0.1/DeezPlayer.Setup-2.0.1.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'deezplayer*'

  checksum      = '47BC9ED0B541FBEC5F8FC935668E3D9EB6243725D8CD106197E9E58E7AA59A26'
  checksumType  = 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
