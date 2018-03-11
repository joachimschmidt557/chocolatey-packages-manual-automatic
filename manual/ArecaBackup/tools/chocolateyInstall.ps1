
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://sourceforge.net/projects/areca/files/areca-stable/areca-7.5/areca-7.5-windows-jre32-setup.exe/download'
$url64      = 'https://sourceforge.net/projects/areca/files/areca-stable/areca-7.5/areca-7.5-windows-jre64-setup.exe/download'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Areca*'

  checksum      = 'E168FE78E53B4F208AA0A5F5353DCB3A64B2F1E17C88FCED7F29E2CD5909526A'
  checksumType  = 'sha256'
  checksum64    = '876190869F454D1EFEDD0E2D57781EA738C70E7CFBD82EC60BB44EB9CB1B83FE'
  checksumType64= 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
