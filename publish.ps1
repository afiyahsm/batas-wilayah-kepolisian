# Publikasikan berkas GeoJSON ke repo GitHub milik sendiri.
#
# PRASYARAT
#   1. Repo KOSONG sudah dibuat di GitHub, dan harus PUBLIC.
#      Repo privat tidak bisa dipakai: alamat raw-nya menuntut token,
#      sedangkan visual Power BI tidak bisa mengirim token.
#   2. Sudah bisa push ke GitHub dari mesin ini (Git Credential Manager
#      akan menanyakan login lewat peramban saat push pertama).
#
# CARA PAKAI - sesuaikan dua baris di bawah lalu jalankan skrip ini.

$RepoUrl    = "https://github.com/afiyahsm/batas-wilayah-kepolisian.git"
$NamaTampil = "Afiyah Ramadhan"
$Email      = "afiyahshuhufam@gmail.com"

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

if (-not (Test-Path ".git")) {
    git init -b main
    git config user.name  $NamaTampil
    git config user.email $Email
    git remote add origin $RepoUrl
} else {
    git remote set-url origin $RepoUrl
}

git add polda.json polres.json polsek.json README.md
git commit -m "Batas wilayah Polda/Polres/Polsek + pemekaran Polda Papua"
git push -u origin main

$owner_repo = ($RepoUrl -replace '^https://github\.com/','' -replace '\.git$','')
Write-Host ""
Write-Host "Selesai. Alamat untuk visual Icon Map:" -ForegroundColor Green
foreach ($f in @("polda.json","polres.json","polsek.json")) {
    Write-Host ("  https://raw.githubusercontent.com/$owner_repo/main/$f")
}
