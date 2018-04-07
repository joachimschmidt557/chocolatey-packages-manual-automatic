
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/downloads/AVbin/AVbin/AVbin10-win32.exe'
$url64      = 'https://github.com/downloads/AVbin/AVbin/AVbin10-win64.exe'
$checksum   = 'CC844CE7F8E6F21ABFD5FE6794DEC06F740FE81494FAC27C66099F1D1C336475'
$checksum64 = '63A6F858C9B97B9CAECBF19724F60548F8C3D6BA6877B7EE31F914D99E5BF854'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64         = $url64

  softwareName  = 'avbin*'

  checksum      = $checksum
  checksumType  = 'sha256'

  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
