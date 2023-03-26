import-module au

$releases = 'https://godotengine.org/download/windows'

function global:au_BeforeUpdate() {
    #Download $Latest.URL32 / $Latest.URL64 in tools directory and remove any older installers.
    Get-RemoteFiles -Purge
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+32-bit:).*"             = "`${1} $($Latest.URL32)"
            "(?i)(\s+64-bit:).*"             = "`${1} $($Latest.URL64)"
            "(?i)(checksum32:).*"           = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"           = "`${1} $($Latest.Checksum64)"
          }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    # Godot_v3.0.6-stable_win64.exe.zip
    # Godot_v3.0.6-stable_win32.exe.zip
    $re_32  = "Godot_v.+-stable_mono_win32.zip"
    $re_64  = "Godot_v.+-stable_mono_win64.zip"
    $url32 = ($download_page.links | ? href -match $re_32 | select -First 1 -expand href).Trim()
    $url64 = ($download_page.links | ? href -match $re_64 | select -First 1 -expand href).Trim()

    $version = ($url32 -split '/' | select -last 1 -skip 1) -Replace '-stable',''

    $Latest = @{ URL32 = $url32; URL64 = $url64; Version = $version }
    return $Latest
}

update -ChecksumFor none -NoCheckChocoVersion
