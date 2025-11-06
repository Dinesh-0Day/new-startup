<#
.SYNOPSIS
  Bootstraps the local development environment.

.DESCRIPTION
  Installs pnpm, sets up Husky hooks, and installs workspace dependencies.
#>

Write-Host "🔧 Bootstrapping QuickStyle development environment..." -ForegroundColor Cyan

# Ensure pnpm is installed
if (-not (Get-Command pnpm -ErrorAction SilentlyContinue)) {
  Write-Host "Installing pnpm via corepack..." -ForegroundColor Yellow
  corepack enable pnpm
}

Write-Host "Installing workspace dependencies via pnpm..." -ForegroundColor Cyan
pnpm install

Write-Host "Bootstrap complete." -ForegroundColor Green

