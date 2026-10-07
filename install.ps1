$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "       AI WINDOWS AGENT" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

$InstallDir = "$env:USERPROFILE\AI-Windows-Agent"

Write-Host "[1/3] Creating folder..." -ForegroundColor Yellow
New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null

Write-Host "[2/3] Creating agent..." -ForegroundColor Yellow

@'
Write-Host ""
Write-Host "AI Windows Agent is running!" -ForegroundColor Green
Write-Host ""
Write-Host "Telegram connection: Coming next"
Write-Host "AI engine: Coming next"
Write-Host "Computer control: Coming next"
Write-Host ""
'@ | Set-Content "$InstallDir\agent.ps1"

Write-Host "[3/3] Creating launcher..." -ForegroundColor Yellow

@"
Set-Location '$InstallDir'
& powershell.exe -ExecutionPolicy Bypass -File '$InstallDir\agent.ps1'
"@ | Set-Content "$InstallDir\start.ps1"

Write-Host ""
Write-Host "======================================" -ForegroundColor Green
Write-Host "       INSTALLATION COMPLETE!" -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Green
Write-Host ""

Start-Process powershell.exe `
    -ArgumentList "-ExecutionPolicy Bypass -File `"$InstallDir\start.ps1`""

Write-Host "AI Windows Agent started."
