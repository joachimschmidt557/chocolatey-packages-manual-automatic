import-module au

$releases = 'https://github.com/mltframework/shotcut/releases'

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
          "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    # https://github.com/mltframework/shotcut/releases/download/v18.03/shotcut-win64-180306.zip
    $re_64  = "shotcut-win64-.+.zip"
    $url64 = $download_page.links | ? href -match $re_64 | select -First 1 -Skip 1 -expand href

    $url64 = "https://github.com" + $url64

    $version = ($url64 -split '/' | select -last 1 -skip 1) -Replace 'v',''

    $Latest = @{ URL64 = $url64; Version = $version }
    return $Latest
}

update -ChecksumFor 64
