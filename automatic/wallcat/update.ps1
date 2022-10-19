import-module au

$releases = 'https://api.github.com/repos/PaitoAnderson/WallcatWindows/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $response = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $json = $response | ConvertFrom-Json

    # Wallcat.exe
    $re  = "Wallcat.exe"

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
