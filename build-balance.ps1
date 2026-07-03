# Converter: balance.csv -> balance.js
# Reads the balance table and generates the JS file the game loads.
$ErrorActionPreference = 'Stop'
$dir = $PSScriptRoot

$rows = Import-Csv -Path "$dir\balance.csv" -Delimiter ';' -Encoding UTF8
$root = [ordered]@{}
$inv = [System.Globalization.CultureInfo]::InvariantCulture

foreach ($row in $rows) {
  $key = ("" + $row.param).Trim()
  if (-not $key -or $key.StartsWith('#')) { continue }   # skip blanks and comments
  $raw = ("" + $row.value).Trim()
  if ($raw -eq '') { continue }                          # header row without a value

  # number (also accepts comma decimals from Excel-RU) or string
  $norm = $raw -replace ',', '.'
  $num = 0.0
  if ([double]::TryParse($norm, [System.Globalization.NumberStyles]::Float, $inv, [ref]$num)) {
    $val = $num
  } else {
    $val = $raw
  }

  # expand dotted key (enemy.walker.hp) into a tree
  $parts = $key.Split('.')
  $node = $root
  for ($i = 0; $i -lt $parts.Count - 1; $i++) {
    $p = $parts[$i]
    if (-not $node.Contains($p)) { $node[$p] = [ordered]@{} }
    $node = $node[$p]
  }
  $node[$parts[$parts.Count - 1]] = $val
}

$json = $root | ConvertTo-Json -Depth 12
$header = "// AUTO-GENERATED from balance.csv (build-balance.ps1) - DO NOT EDIT BY HAND.`n" +
          "// Edit balance.csv, then run build-balance.bat or publish.bat.`n"
$content = $header + "window.BALANCE = " + $json + ";`n"
[System.IO.File]::WriteAllText("$dir\balance.js", $content, (New-Object System.Text.UTF8Encoding $false))

$count = ($root.Keys | ForEach-Object { $root[$_] } | Measure-Object).Count
Write-Host "balance.js updated from balance.csv ($($root.Keys.Count) sections)" -ForegroundColor Green
