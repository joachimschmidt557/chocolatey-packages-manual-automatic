import-module au

$releases = 'https://github.com/sharkdp/fd/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    # fd-v6.2.0-i686-pc-windows-gnu.zip
    $re  = "fd-v.+-i686-pc-windows-gnu.zip"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href
    $url = "https://github.com" + $url

    $version = ($url -split '-' | select -last 1 -skip 4) -Replace 'v',''

    $Latest = @{ URL = $url; Version = $version }
    return $Latest
}

update -ChecksumFor 32
