$ErrorActionPreference = "Stop"

$project = $PSScriptRoot
$dist = Join-Path $project "dist"
$output = Join-Path $dist "spartan-quivers-cape-1.0.0-1.21.1-neoforge.jar"

New-Item -ItemType Directory -Path $dist -Force | Out-Null
Remove-Item -LiteralPath $output -Force -ErrorAction SilentlyContinue

& jar --create --file $output -C (Join-Path $project "resources") .
if ($LASTEXITCODE -ne 0) { throw "jar failed with exit code $LASTEXITCODE" }

Write-Host "Built: $output"
