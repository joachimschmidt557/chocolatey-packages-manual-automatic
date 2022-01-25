import-module au

$releases = 'https://github.com/oleksis/youtube-dl-gui/releases'

function global:au_SearchReplace {

    @{
        "$($Latest.PackageName).nuspec" = @{
          "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
      }

}

function global:au_BeforeUpdate() {
  # Skip download of installer
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $re  = "yt-dlg.*\.msi"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = ( $url -split '/' | select -last 1 -Skip 1 | % SubString(1) )

    $Latest = @{ URL32 = ("https://github.com" + $url); Version = $version }
    return $Latest
}

update -ChecksumFor none
