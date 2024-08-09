
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://deploy.totallyacdn.com/desktop-apps/2.11.5/Windscribe_2.11.5_guinea_pig.exe'

Confirm-Win10

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  unzipLocation   = $toolsDir
  fileType        = 'EXE'
  url64           = $url

  softwareName    = 'windscribe*'

  checksum64      = 'bc6e594c3da954536bb7090d564633552fe342065400e68327d0110b559f8a29'
  checksumType64  = 'sha256'

  silentArgs      = '-silent'
  validExitCodes  = @(0)
}

Install-ChocolateyPackage @packageArgs
