Install-ChocolateyZipPackage -PackageName 'Accents' `
  -Url 'http://www.dcmembers.com/skrommel/download/accents/?wpdmdl=6' `
  -UnzipLocation "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" `
  -Checksum "D6B06BA79E4E67BC5A09E64EACE99E9A91E92F2F691CA7852D761BE26B1FEABF" `
  -ChecksumType "sha256"