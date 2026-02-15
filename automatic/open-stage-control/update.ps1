import-module au

$releases = 'https://framagit.org/api/v4/projects/jean-emmanuel%2Fopen-stage-control/releases'

function global:au_BeforeUpdate() {
    #Download $Latest.URL32 / $Latest.URL64 in tools directory and remove any older installers.
    Get-RemoteFiles -Purge
}

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            # "(?i)(\s+32-bit:).*"             = "`${1} $($Latest.URL32)"
            "(?i)(\s+64-bit:).*"             = "`${1} $($Latest.URL64)"
            # "(?i)(checksum32:).*"           = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"           = "`${1} $($Latest.Checksum64)"
        }

        'tools\chocolateyInstall.ps1' = @{
            "(^[$]fileName\s*=\s*)('.*')"      = "`$1'$($Latest.FileName64)'"
        }
     }
}

function global:au_GetLatest {
    # $token = ConvertTo-SecureString $Env:github_api_key -AsPlainText -Force
    $response = Invoke-WebRequest -Uri $releases -UseBasicParsing # -Authentication Bearer -Token $token
    $json = ConvertFrom-Json $response

    $link_name_64 = "Windows (64-bit)"

    foreach ($release in $json) {
        # $asset32 = $release.assets.links | ? name -eq $link_name_32
        $asset64 = $release.assets.links | ? name -eq $link_name_64

        # if ($asset32 -eq $null) { continue }
        if ($asset64 -eq $null) { continue }

        # $url32 = $asset32.url
        $url64 = $asset64.url

        $version = $release.tag_name -Replace 'v',''

        $Latest = @{ URL64 = $url64; Version = $version }
        return $Latest
    }

    throw "No release with suitable binaries found."
}

update -ChecksumFor none
