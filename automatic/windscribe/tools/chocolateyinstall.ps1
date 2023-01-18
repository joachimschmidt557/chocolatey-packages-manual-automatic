
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://deploy.totallyacdn.com/desktop-apps/2.6.6/Windscribe_2.6.6_guinea_pig.exe'

Confirm-Win10

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64         = $url

  softwareName  = 'windscribe*'

  checksum      = 'e745ca01131411641a296ae953908000a1c6e6acddfcb9b98fa1bf16da999e5a'
  checksumType  = 'sha256'

  silentArgs   = '-silent'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
