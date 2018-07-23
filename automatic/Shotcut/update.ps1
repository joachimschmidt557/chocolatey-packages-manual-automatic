import-module au

$releases = 'https://www.shotcut.org/download/'

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
          "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    # https://github.com/mltframework/shotcut/releases/download/v18.03/shotcut-win64-180306.exe
    $re_32  = "shotcut-win32-.+.exe"
    $url32 = $download_page.links | ? href -match $re_32 | select -First 1 -expand href

    #$url32 = "https://github.com" + $url32
    #$url64 = "https://github.com" + $url64

    $version = ($url32 -split '/' | select -last 1 -skip 1) -Replace 'v',''

    $Latest = @{ URL32 = $url32; Version = $version }
    return $Latest
}

update
