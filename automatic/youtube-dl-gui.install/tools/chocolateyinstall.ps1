
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/MrS0m30n3/youtube-dl-gui/releases/download/0.4/youtube-dl-gui-0.4-win-setup.zip'
$checksum   = '230690b25bd1c5bf7e396f905fa51c6760af93ad24a50ce2fb0eee5ffa9d7068'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url

  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$installPackageArgs = @{
  packageName = $env:ChocolateyPackageName
  fileType = 'EXE'
  File = Get-ChildItem -Recurse $toolsDir\*youtube-dlg-*.exe | Select-Object -First 1

  softwareName = 'Youtube-DLG*'

  checksum      = $checksum
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @installPackageArgs

Get-ChildItem $toolsDir\*.exe | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content -Value "" -Path "$_.ignore" }}
