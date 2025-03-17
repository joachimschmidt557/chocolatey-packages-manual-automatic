import-module au

$releases = 'https://api.github.com/repos/godotengine/godot-builds/releases'

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

    # Godot_v3.0.6-stable_win64.exe.zip
    # Godot_v3.0.6-stable_win32.exe.zip
    # Godot_v4.4.1-rc1_win32.exe.zip
    $re_32  = "Godot_v.+_win32.exe.zip"
    $re_64  = "Godot_v.+_win64.exe.zip"

    foreach ($release in $json) {
        $asset32 = $release.assets | ? name -match $re_32
        $asset64 = $release.assets | ? name -match $re_64

        if ($asset32 -eq $null) { continue }
        if ($asset64 -eq $null) { continue }

        $url32 = $asset32.browser_download_url
        $url64 = $asset64.browser_download_url

        $version = $release.tag_name -Replace '-stable',''

        $Latest = @{ URL32 = $url32; URL64 = $url64; Version = $version }
        return $Latest
    }

    throw "No release with suitable binaries found."
}

update -ChecksumFor none
