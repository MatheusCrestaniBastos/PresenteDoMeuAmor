@echo off
setlocal enabledelayedexpansion

echo ================================================
echo RENOMEAR TODAS AS FOTOS - VERSAO SIMPLES
echo ================================================
echo.
echo Este script vai renomear TODOS os arquivos
echo na pasta para: foto001.jpg, foto002.jpg, etc.
echo.
echo IMPORTANTE: Execute este arquivo DENTRO da pasta "fotos"
echo.
pause

set contador=1

echo.
echo Renomeando arquivos...
echo.

for %%f in (*.*) do (
    if not "%%f"=="renomear-fotos-SIMPLES.bat" (
        set "numero=00!contador!"
        set "numero=!numero:~-3!"
        
        set "extensao=%%~xf"
        if "!extensao!"=="" set "extensao=.jpg"
        
        ren "%%f" "foto!numero!!extensao!" 2>nul
        
        if !errorlevel! equ 0 (
            echo [OK] %%f renomeado para foto!numero!!extensao!
        ) else (
            echo [AVISO] Nao foi possivel renomear %%f
        )
        
        set /a contador+=1
    )
)

echo.
echo ================================================
echo PRONTO! Arquivos renomeados!
echo ================================================
echo.
echo Agora abra o index.html ou site-para-ela.html
echo para ver as fotos no site!
echo.
pause
