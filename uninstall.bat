@echo off
REM Restaure les fichiers originaux (script.mpk.bak, system.mpk.bak).
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0installer\uninstall.ps1"
