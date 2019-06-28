import-module au

$releases = 'https://dl.jami.net/windows/'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    #tidy-5.1.25-win64.zip
    #$latest_url_32 = $download_page.links | ? href -match 'ring-windows-nightly-[0-9]+~.+' | select -last 1 -expand href
    $latest_url_64 = $download_page.links | ? href -match 'ring-windows-nightly_x86_64-[0-9]+~.+' | select -last 1 -expand href

    $raw = ($latest_url_64 -split '-' | select -last 1) -split '~' | select -first 1
    $year = $raw[0..3] -join ''
    $month = $raw[4..5] -join ''
    $day = $raw[6..7] -join ''
    $version = $year + '.' + $month + '.' + $day + '-nightly'
    #$url32 = 'https://dl.ring.cx/windows/' + $latest_url_32
    $url64 = 'https://dl.ring.cx/windows/' + $latest_url_64

    $Latest = @{ URL64 = $url64; Version = $version }
    return $Latest
}

update