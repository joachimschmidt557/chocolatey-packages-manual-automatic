
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://deploy.totallyacdn.com/desktop-apps/2.7.4/Windscribe_2.7.4_guinea_pig.exe'

Confirm-Win10

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64         = $url

  softwareName  = 'windscribe*'

  checksum      = 'ed7038847432c07c46a403d08b549273462bafae3c5125c18786cdeb18bfff57'
  checksumType  = 'sha256'

  silentArgs   = '-silent'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
