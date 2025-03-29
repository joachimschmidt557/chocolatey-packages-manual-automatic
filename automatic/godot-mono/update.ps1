import-module au

$releases = 'https://api.github.com/repos/godotengine/godot-builds/releases?per_page=60'

function global:au_BeforeUpdate() {
    #Download $Latest.URL32 / $Latest.URL64 in tools directory and remove any older installers.
    Get-RemoteFiles -Purge
}

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+32-bit:).*"             = "`${1} $($Latest.URL32)"
            "(?i)(\s+64-bit:).*"             = "`${1} $($Latest.URL64)"
            "(?i)(checksum32:).*"           = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"           = "`${1} $($Latest.Checksum64)"
        }

        'tools\chocolateyInstall.ps1' = @{
            "(^[$]fileName32\s*=\s*)('.*')"      = "`$1'$($Latest.FileName32)'"
            "(^[$]fileName64\s*=\s*)('.*')"      = "`$1'$($Latest.FileName64)'"
        }
    }
}

function global:au_GetLatest {
    $token = ConvertTo-SecureString $Env:github_api_key -AsPlainText -Force
    $response = Invoke-WebRequest -Uri $releases -UseBasicParsing -Authentication Bearer -Token $token
    $json = ConvertFrom-Json $response

    # see https://docs.godotengine.org/en/stable/about/release_policy.html
    # TODO omitted 3.7 for now as no corresponding release exists yet
    $supported_version_families = @("3.5", "3.6", "4.2", "4.3", "4.4", "4.5")

    # Godot_v4.5-dev1_mono_win32.zip
    # Godot_v4.5-dev1_mono_win64.zip
    $re_32  = "Godot_v.+_mono_win32.zip"
    $re_64  = "Godot_v.+_mono_win64.zip"

    $Streams = [ordered] @{}

    foreach ($version_family in $supported_version_families) {
        $data = $null

        foreach ($release in $json) {
            if (!$release.tag_name.StartsWith($version_family)) { continue }

            $asset32 = $release.assets | ? name -match $re_32
            $asset64 = $release.assets | ? name -match $re_64

            if ($asset32 -eq $null) { continue }
            if ($asset64 -eq $null) { continue }

            $url32 = $asset32.browser_download_url
            $url64 = $asset64.browser_download_url

            $version = $release.tag_name -Replace '-stable',''

            $data = @{ URL32 = $url32; URL64 = $url64; Version = $version }
            break
        }

        if ($data -eq $null) {
            throw "No release with suitable binaries found for version family $version_family."
        }

        $Streams.Add($version_family, $data)
    }

    @{
        Streams = $Streams
    }
}

update -ChecksumFor none
