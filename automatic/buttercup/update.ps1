import-module au

$releases = 'https://github.com/buttercup/buttercup-desktop/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    # buttercup-desktop-setup-1.6.0.exe
    $re  = "buttercup-desktop-.+.exe"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = ($url -split '-' | select -last 1).replace(".exe","")

    $Latest = @{ URL = ("https://github.com" + $url); Version = $version }
    return $Latest
}

update -ChecksumFor 32
