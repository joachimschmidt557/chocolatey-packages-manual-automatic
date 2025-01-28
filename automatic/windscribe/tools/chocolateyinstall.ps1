
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/Windscribe/Desktop-App/releases/download/v2.13.8/Windscribe_2.13.8.exe'

Confirm-Win10

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  unzipLocation   = $toolsDir
  fileType        = 'EXE'
  url64           = $url

  softwareName    = 'windscribe*'

  checksum64      = '875ee772040c5276fa38b2de57df3593b804334f35f44aece35022a24068187c'
  checksumType64  = 'sha256'

  silentArgs      = '-silent'
  validExitCodes  = @(0)
}

Install-ChocolateyPackage @packageArgs
