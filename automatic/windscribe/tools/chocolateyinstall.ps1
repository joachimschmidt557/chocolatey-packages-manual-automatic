
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/Windscribe/Desktop-App/releases/download/v2.23.5/Windscribe_2.23.5_guinea_pig_amd64.exe'

Confirm-Win10

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  unzipLocation   = $toolsDir
  fileType        = 'EXE'
  url64           = $url

  softwareName    = 'windscribe*'

  checksum64      = 'd9020541bef258850382ce31aa36b0dac9ec75d92fd41192d55b1233439eeb70'
  checksumType64  = 'sha256'

  silentArgs      = '-silent'
  validExitCodes  = @(0)
}

Install-ChocolateyPackage @packageArgs
