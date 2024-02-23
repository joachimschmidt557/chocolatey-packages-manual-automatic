
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://deploy.totallyacdn.com/desktop-apps/2.9.9/Windscribe_2.9.9.exe'

Confirm-Win10

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  unzipLocation   = $toolsDir
  fileType        = 'EXE'
  url64           = $url

  softwareName    = 'windscribe*'

  checksum64      = 'd2a817e8f2738cacc646d3dc2194d7fd28f2ce1de435be24fa98ed8928b4daa2'
  checksumType64  = 'sha256'

  silentArgs      = '-silent'
  validExitCodes  = @(0)
}

Install-ChocolateyPackage @packageArgs
