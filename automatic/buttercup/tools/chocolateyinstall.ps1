
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/buttercup/buttercup-desktop/releases/download/v2.24.3/Buttercup-win-x64-2.24.3-installer.exe'
$checksum64 = 'b3e44f3ce8c5b5dfa7e94e9e7e02e3c38beb12a5ce9acc4a606dacc2104295bc'

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
