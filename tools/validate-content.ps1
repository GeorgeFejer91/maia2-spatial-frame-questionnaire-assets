Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot

function Read-Json($relativePath) {
    $path = Join-Path $root $relativePath
    if (-not (Test-Path -LiteralPath $path)) {
        throw "Missing file: $relativePath"
    }
    Get-Content -LiteralPath $path -Raw -Encoding UTF8 | ConvertFrom-Json
}

function Assert-Equal($actual, $expected, $message) {
    if ($actual -ne $expected) {
        throw "$message Expected=$expected Actual=$actual"
    }
}

function Assert-ArrayEqual($actual, $expected, $message) {
    $actualText = @($actual) -join ','
    $expectedText = @($expected) -join ','
    if ($actualText -ne $expectedText) {
        throw "$message Expected=$expectedText Actual=$actualText"
    }
}

$manifest = Read-Json 'content/program.manifest.json'
$maiaEn = Read-Json 'content/maia2/en.json'
$maiaDe = Read-Json 'content/maia2/de.json'
$scoring = Read-Json 'content/maia2/scoring.json'
$pictograph = Read-Json 'content/spatial-frame-reference-pictograph.json'
$checksums = Read-Json 'content/source-checksums.json'

Assert-Equal $manifest.blocks.Count 3 'Program should define three blocks.'
Assert-Equal $maiaEn.items.Count 37 'English MAIA-2 should contain 37 items.'
Assert-Equal $maiaDe.items.Count 37 'German MAIA-2 should contain 37 items.'
Assert-Equal $scoring.subscales.Count 8 'MAIA-2 should define 8 subscales.'
Assert-ArrayEqual $scoring.reverseScoredItems @(5,6,7,8,9,10,11,12,15) 'MAIA-2 reverse-scored items mismatch.'
Assert-ArrayEqual $pictograph.choices @('A','B','C','D','E','F','G','H') 'Pictograph choices mismatch.'
Assert-Equal $pictograph.administrations.Count 2 'Pictograph should be administered twice.'

foreach ($languageFile in @('content/i18n/en.json', 'content/i18n/de.json')) {
    [void](Read-Json $languageFile)
}

$assetPath = Join-Path $root $pictograph.asset.path
if (-not (Test-Path -LiteralPath $assetPath)) {
    throw "Missing pictograph asset: $($pictograph.asset.path)"
}

$actualAssetHash = (Get-FileHash -LiteralPath $assetPath -Algorithm SHA256).Hash
Assert-Equal $actualAssetHash $pictograph.asset.sha256 'Pictograph checksum mismatch.'

foreach ($file in @($checksums.files)) {
    $path = Join-Path $root $file.path
    if (-not (Test-Path -LiteralPath $path)) {
        throw "Missing checksum-listed file: $($file.path)"
    }
    $actualHash = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash
    Assert-Equal $actualHash $file.sha256 "Checksum mismatch for $($file.path)."
}

Write-Host 'Content validation passed.'
