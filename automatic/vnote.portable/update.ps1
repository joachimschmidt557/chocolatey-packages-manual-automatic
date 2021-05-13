import-module au

$releases = 'https://github.com/vnotex/vnote/releases'

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
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    # vnote-win-x86_.+.zip
    # vnote-win-x64_.+.zip
    $re_32  = "vnote-win-x86_.+.zip"
    $re_64  = "vnote-win-x64_.+.zip"
    $url32 = $download_page.links | ? href -match $re_32 | select -First 1 -expand href
    $url64 = $download_page.links | ? href -match $re_64 | select -First 1 -expand href

    $url32 = "https://github.com" + $url32
    $url64 = "https://github.com" + $url64

    $version = ($url64 -split '/' | select -last 1 -skip 1) -Replace 'v',''

    $Latest = @{ URL32 = $url32; URL64 = $url64; Version = $version }
    return $Latest
}

update
