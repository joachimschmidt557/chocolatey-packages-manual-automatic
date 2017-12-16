
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/IrosTheBeggar/mStream/releases/download/v3.2.0/mStreamExpress-installer-v0.6.exe'
$url64      = ''

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'ring*'

  checksum      = '923B68A419FF86FF5F0471820C1A7A6BB952163E02A7BA5779B8EA32F40F8716'
  checksumType  = 'sha256'
  checksum64    = ''
  checksumType64= ''

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
