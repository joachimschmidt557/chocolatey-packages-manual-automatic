import-module au

$releases = 'https://api.github.com/repos/mltframework/shotcut/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $token = ConvertTo-SecureString $Env:github_api_key -AsPlainText -Force
    $response = Invoke-WebRequest -Uri $releases -UseBasicParsing -Authentication Bearer -Token $token
    $json = ConvertFrom-Json $response

    # shotcut-win64-180306.zip
    $re_64  = "shotcut-win64-.+.zip"

    foreach ($release in $json) {
        # $asset32 = $release.assets | ? name -match $re_32
        $asset64 = $release.assets | ? name -match $re_64

        # if ($asset32 -eq $null) { continue }
        if ($asset64 -eq $null) { continue }

        # $url32 = $asset32.browser_download_url
        $url64 = $asset64.browser_download_url

        $version = $release.tag_name -Replace 'v',''

        if ($release.prerelease) {
            $version = $version + "-pre"
        }

        $Latest = @{ URL64 = $url64; Version = $version }
        return $Latest
    }

    throw "No release with suitable binaries found."
}

update -ChecksumFor 64
