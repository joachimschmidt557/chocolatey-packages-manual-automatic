$download_page = Invoke-WebRequest -Uri "https://www.dcmembers.com/skrommel/download/accents/" -UseBasicParsing
$link = $download_page.Links | where onclick -match "location.href.*" | select -first 1
$onclick = $link.onclick
$url = $onclick -replace "location.href='","" -replace "';return false;",""

Install-ChocolateyZipPackage -PackageName 'Accents' `
  -Url $url `
  -UnzipLocation "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" `
  -Checksum "8d2113e8a4b27db816f499c962aa87d0f38acf8d7c273c61d0054ce950197a77" `
  -ChecksumType "sha256"
