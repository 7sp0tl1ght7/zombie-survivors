# Build ZombieSurvivors.html from sources and publish to GitHub Pages.
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

# 1. Regenerate balance.js from balance.csv
& "$PSScriptRoot\build-balance.ps1"

# 2. Build the single-file version (for sending as a file in messengers)
$utf8 = [System.Text.Encoding]::UTF8
$html = [System.IO.File]::ReadAllText("$PSScriptRoot\index.html", $utf8)
$bal  = [System.IO.File]::ReadAllText("$PSScriptRoot\balance.js", $utf8)
$js   = [System.IO.File]::ReadAllText("$PSScriptRoot\game.js", $utf8)
$out  = $html.Replace('<script src="balance.js"></script>', "<script>`n$bal`n</script>")
$out  = $out.Replace('<script src="game.js"></script>', "<script>`n$js`n</script>")
[System.IO.File]::WriteAllText("$PSScriptRoot\ZombieSurvivors.html", $out, (New-Object System.Text.UTF8Encoding $false))
Write-Host "Bundle built: ZombieSurvivors.html" -ForegroundColor Green

# 3. Commit and push - the site updates itself in 1-2 minutes
git add -A
$msg = Read-Host "What changed? (Enter = 'Update game')"
if (-not $msg) { $msg = "Update game" }
git commit -m $msg
git push
Write-Host ""
Write-Host "Done! In 1-2 min: https://7sp0tl1ght7.github.io/zombie-survivors/" -ForegroundColor Green
Write-Host "Deploy status: https://github.com/7sp0tl1ght7/zombie-survivors/actions"
