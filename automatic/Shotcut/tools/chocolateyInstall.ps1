$packageName= 'Shotcut'
$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/mltframework/shotcut/releases/download/v17.11/shotcut-win32-171107.exe'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v17.11/shotcut-win64-171107.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  silentArgs    = "/S"
  validExitCodes= @(0)
  softwareName  = 'Shotcut*'
  checksum      = '321DD558934C91AD17CC7BC034887E0F0AC8F5D80DECC9E0647ACF3CC4E3B443'
  checksumType  = 'sha256'
  checksum64    = 'F690C5360EC4315377D90B19711870A3746DBFB691651A3396FE20E379582D3E'
  checksumType64= 'sha256'
}

Install-ChocolateyPackage @packageArgs