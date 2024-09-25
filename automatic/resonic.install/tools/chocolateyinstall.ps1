
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://resonic.at/get/player'
$checksum   = '53dae7caaaa3568deecff4f29a4d1c67291e3f8cddf47df7930109189bdcb4af'

$options     = @{
  Headers       = @{
    'User-Agent' = "Mozilla/5.0 (Windows NT 10.0; rv:129.0) Gecko/20100101 Firefox/129.0"
  }
}
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'resonic*'

  checksum      = $checksum
  checksumType  = 'sha256'

  options       = $options

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
