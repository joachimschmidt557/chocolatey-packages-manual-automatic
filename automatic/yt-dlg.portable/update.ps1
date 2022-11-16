import-module au

$releases = 'https://api.github.com/repos/oleksis/youtube-dl-gui/releases'

function global:au_BeforeUpdate() {
    #Download $Latest.URL32 / $Latest.URL64 in tools directory and remove any older installers.
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+URL:).*"             = "`${1} $($Latest.URL32)"
            "(?i)(checksum:).*"           = "`${1} $($Latest.Checksum32)"
          }
    }
}

function global:au_GetLatest {
    $token = ConvertTo-SecureString $Env:github_api_key -AsPlainText -Force
    $response = Invoke-WebRequest -Uri $releases -UseBasicParsing -Authentication Bearer -Token $token
    $json = ConvertFrom-Json $response

    # yt-dlg.exe
    $re_32  = "yt-dlg.exe"

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
