
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.12.16/shotcut-win32-191216.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.12.16/shotcut-win64-191216.exe'
$checksum32 = '8be0a3ed2ce0b6e412817e1691e20a29430325f45562f451de8a9515738aebac'
$checksum64 = 'ceee162fa683220b098ef0f05ecdd134d75a3a58e9f57c3a42471017fea83079'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32
  url64Bit      = $url64

  softwareName  = 'shotcut*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
