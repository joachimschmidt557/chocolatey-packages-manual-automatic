import-module au

$releases = 'https://api.github.com/repos/IrosTheBeggar/mStream/releases'

function global:au_SearchReplace {

    @{
        "$($Latest.PackageName).nuspec" = @{
          "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
      }

}

function global:au_GetLatest {
    $response = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $json = $response | ConvertFrom-Json

    # mStream-Server-Setup-5.11.4.exe
    $re_32  = "mStream-Server-Setup-.*.exe$"

    foreach ($release in $json) {
        $asset32 = $release.assets | ? name -match $re_32
        # $asset64 = $release.assets | ? name -match $re_64

        if ($asset32 -eq $null) { continue }
        # if ($asset64 -eq $null) { continue }

        $url32 = $asset32.browser_download_url
        # $url64 = $asset64.browser_download_url

        $version = $release.tag_name -Replace 'v',''

        $Latest = @{ URL32 = $url32; Version = $version }
        return $Latest
    }

    throw "No release with suitable binaries found."
}

update -ChecksumFor 32
