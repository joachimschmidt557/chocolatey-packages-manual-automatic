import-module au

$releases = 'https://api.github.com/repos/mmckegg/loop-drop-app/releases'

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
    $response = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $json = $response | ConvertFrom-Json

    # Loop.Drop.v3.0.1.x64.msi
    $re_32  = "Loop.Drop.v[^A-Za-z]+.msi"
    $re_64  = "Loop.Drop.v[^A-Za-z]+.x64.msi"
    $url32 = $download_page.links | ? href -match $re_32 | select -First 1 -expand href
    $url64 = $download_page.links | ? href -match $re_64 | select -First 1 -expand href

    foreach ($release in $json) {
        $asset32 = $release.assets | ? name -match $re_32
        $asset64 = $release.assets | ? name -match $re_64

        if ($asset32 -eq $null) { continue }
        if ($asset64 -eq $null) { continue }

        $url32 = $asset32.browser_download_url
        $url64 = $asset64.browser_download_url

        $version = $release.tag_name -Replace 'v',''

        $Latest = @{ URL32 = $url32; URL64 = $url64; Version = $version }
        return $Latest
    }
}

update
