
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/buttercup/buttercup-desktop/releases/download/v2.10.0/Buttercup-win-x64-2.10.0-installer.exe'
$checksum64 = 'aaa7a7a4631ed48d5189590400acad5abac523649d7eb2069a4f57b50cfd406b'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64Bit      = $url64

  softwareName  = 'buttercup*'

  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
