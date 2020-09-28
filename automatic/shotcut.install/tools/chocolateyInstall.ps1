
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v20.09.27/shotcut-win32-200927.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v20.09.27/shotcut-win64-200927.exe'
$checksum32 = '8150459671a739fde8cb3e2bcbd6f4421f17f35ff20bf784850964872b2a110f'
$checksum64 = '83e954bbe91905820391e4cf91de14c39464e01ad56c34de7088bb11175ebae9'

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
