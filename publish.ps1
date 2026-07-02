# Сборка ZombieSurvivors.html из исходников и публикация на GitHub Pages
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

# 1. Собираем однофайловую версию (для отправки файлом в мессенджерах)
$utf8 = [System.Text.Encoding]::UTF8
$html = [System.IO.File]::ReadAllText("$PSScriptRoot\index.html", $utf8)
$js   = [System.IO.File]::ReadAllText("$PSScriptRoot\game.js", $utf8)
$out  = $html.Replace('<script src="game.js"></script>', "<script>`n$js`n</script>")
[System.IO.File]::WriteAllText("$PSScriptRoot\ZombieSurvivors.html", $out, (New-Object System.Text.UTF8Encoding $false))
Write-Host "Бандл собран: ZombieSurvivors.html" -ForegroundColor Green

# 2. Коммитим и пушим — сайт обновится сам через 1-2 минуты
git add -A
$msg = Read-Host "Что изменилось? (Enter = 'Update game')"
if (-not $msg) { $msg = "Update game" }
git commit -m $msg
git push
Write-Host ""
Write-Host "Готово! Через 1-2 минуты обновится https://7sp0tl1ght7.github.io/zombie-survivors/" -ForegroundColor Green
Write-Host "Статус деплоя: https://github.com/7sp0tl1ght7/zombie-survivors/actions"
