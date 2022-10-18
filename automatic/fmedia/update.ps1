import-module au

$releases = 'https://api.github.com/repos/stsaz/fmedia/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            #"(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            #"(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $response = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $json = $response | ConvertFrom-Json

    # fmedia-0.34.1-win-x64.zip
    #$re_32  = "fmedia-.+-win-x64.zip"
    $re_64  = "fmedia-.+-win-x64.zip"

    foreach ($release in $json) {
        # $asset32 = $release.assets | ? name -match $re_32
        $asset64 = $release.assets | ? name -match $re_64

        # if ($asset32 -eq $null) { continue }
        if ($asset64 -eq $null) { continue }

        # $url32 = $asset32.browser_download_url
        $url64 = $asset64.browser_download_url

        $version = $release.tag_name -Replace 'v',''

        $Latest = @{ URL64 = $url64; Version = $version }
        return $Latest
    }

    throw "No release with suitable binaries found."
}

update -ChecksumFor 64
