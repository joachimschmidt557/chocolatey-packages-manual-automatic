# We need to fetch the download page and extract the URL from there as
# it changes periodically

$download_page = Invoke-WebRequest -Uri "https://www.dcmembers.com/skrommel/download/bigbyte/" -UseBasicParsing
$link = $download_page.Links | where onclick -match "location.href.*" | select -first 1
$onclick = $link.onclick
$url = $onclick -replace "location.href='","" -replace "';return false;",""

Install-ChocolateyZipPackage -PackageName 'BigByte' `
  -Url $url `
  -UnzipLocation "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" `
  -Checksum "4ab78826459bcb9dfe66925d1cba7729db77562ee320bf6f7e8331ae574b5831" `
  -ChecksumType "sha256"
