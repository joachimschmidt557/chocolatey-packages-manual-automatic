import-module au

$releases = 'https://github.com/quodlibet/quodlibet/releases'

function global:au_SearchReplace {

    @{
        "$($Latest.PackageName).nuspec" = @{
          "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
      }

}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    #quodlibet-4.0.2-portable.exe
    $re  = "quodlibet-.+-portable.exe"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = ($url -split '-' | select -last 1 -Skip 1)

    $Latest = @{ URL = ("https://github.com" + $url); Version = $version }
    return $Latest
}

update -ChecksumFor 32
