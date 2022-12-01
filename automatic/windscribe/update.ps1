Import-Module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')" = "`$1'$($Latest.Url64)'"
            "(^\s*?checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
        "$($Latest.PackageName).nuspec" = @{
          '(\<copyright\>).*?(\<\/copyright\>)' = "`${1}$(Get-Date -Format yyyy) Windscribe Limited`$2"
        }
    }
}

function global:au_GetLatest {
  $changelogUrl = 'https://windscribe.com/changelog/windows'
  $userAgent = 'Update checker of Chocolatey Community Package ''windscribe'''
  $changelogPage = Invoke-WebRequest -Uri $changelogUrl -UserAgent $userAgent -UseBasicParsing

  if ($changelogPage.Content -notmatch '> v([\d\.]+)</a> \(Alpha\) </h3>')
  {
    throw 'Alpha version not found!'
  }
  $alphaVersion = $Matches[1]
  $alphaUrl = $changelogPage.Links | Where-Object href -like "*/$alphaVersion/*" | Select-Object -First 1 -Expand href

  if ($changelogPage.Content -notmatch '> v([\d\.]+)</a> \(Beta\) </h3>')
  {
    throw 'Beta version not found!'
  }
  $betaVersion = $Matches[1]
  $betaUrl = $changelogPage.Links | Where-Object href -like "*/$betaVersion/*" | Select-Object -First 1 -Expand href

  if ($changelogPage.Content -notmatch '> v([\d\.]+)</a> </h3>')
  {
    throw 'Stable version not found!'
  }
  $stableVersion = $Matches[1]
  $stableUrl = $changelogPage.Links | Where-Object href -like "*/$stableVersion/*" | Select-Object -First 1 -Expand href

  $streams = [ordered] @{
    Alpha = @{ Url64 = $alphaUrl; Version = "$alphaVersion-alpha" }
    Beta = @{ Url64 = $betaUrl; Version = "$betaVersion-beta" }
    Stable = @{ Url64 = $stableUrl; Version = $stableVersion }
  }

  return @{ Streams = $streams }
}

Update-Package -ChecksumFor 64 -NoReadme
