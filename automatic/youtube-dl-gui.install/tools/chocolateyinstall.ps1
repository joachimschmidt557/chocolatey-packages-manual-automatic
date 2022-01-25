
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checksum   = '71D4FC4EEA97199218FDDE36717E90326ED0FD4BD980C6AFBFFC263514E34BE9'

$installPackageArgs = @{
  packageName = $env:ChocolateyPackageName
  fileType = 'MSI'
  file64 = Get-Item "$toolsDir\yt-dlg.msi"

  softwareName = 'yt-dlg'

  checksum64      = $checksum
  checksumType  = 'sha256'

  silentArgs   = '/qn'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @installPackageArgs

Get-ChildItem $toolsDir\*.msi | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content -Value "" -Path "$_.ignore" }}
