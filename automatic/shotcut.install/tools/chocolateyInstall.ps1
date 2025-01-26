
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v25.01.25/shotcut-win64-250125.exe'
$checksum64 = 'c5486d2793e1c996ee106eb10202da3f961b0c53c973e6740fc144244ee84a9c'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64Bit      = $url64

  softwareName  = 'shotcut*'

  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
