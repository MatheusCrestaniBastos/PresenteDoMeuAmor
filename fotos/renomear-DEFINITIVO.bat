@echo off
setlocal enabledelayedexpansion

echo ================================================
echo RENOMEAR FOTOS - VERSAO DEFINITIVA
echo ================================================
echo.
echo Este script vai:
echo 1. Encontrar TODAS as imagens na pasta
echo 2. Renomear EM SEQUENCIA: foto001.jpg, foto002.jpg...
echo 3. Ignorar arquivos que nao sao imagens
echo.
echo IMPORTANTE: Execute dentro da pasta "fotos"
echo.
pause

echo.
echo Processando...
echo.

REM Criar pasta temporaria
if not exist temp mkdir temp

REM Contador
set contador=1

REM Processar apenas arquivos de imagem
for %%f in (*.jpg *.jpeg *.png *.gif *.webp *.bmp *.JPG *.JPEG *.PNG *.GIF *.WEBP *.BMP) do (
    REM Pular se for o proprio script
    if /I not "%%f"=="renomear-DEFINITIVO.bat" (
        set "numero=00!contador!"
        set "numero=!numero:~-3!"
        
        REM Pegar extensao original em minusculo
        set "extensao=%%~xf"
        
        REM Se a extensao for maiuscula, converter para minuscula
        if /I "!extensao!"==".JPG" set "extensao=.jpg"
        if /I "!extensao!"==".JPEG" set "extensao=.jpg"
        if /I "!extensao!"==".PNG" set "extensao=.png"
        if /I "!extensao!"==".GIF" set "extensao=.gif"
        if /I "!extensao!"==".WEBP" set "extensao=.webp"
        if /I "!extensao!"==".BMP" set "extensao=.bmp"
        
        REM Se nao tiver extensao, adicionar .jpg
        if "!extensao!"=="" set "extensao=.jpg"
        
        REM Novo nome
        set "novoNome=foto!numero!!extensao!"
        
        REM Mover para temp primeiro (evita conflitos)
        move "%%f" "temp\!novoNome!" >nul 2>&1
        
        if !errorlevel! equ 0 (
            echo [OK] %%f --^> foto!numero!!extensao!
            set /a contador+=1
        ) else (
            echo [ERRO] Nao foi possivel processar: %%f
        )
    )
)

echo.
echo Movendo fotos de volta...
echo.

REM Mover todas as fotos da temp de volta
move temp\*.* . >nul 2>&1

REM Remover pasta temp
rmdir temp 2>nul

set /a total=contador-1

echo.
echo ================================================
echo PRONTO! Total de fotos renomeadas: %total%
echo ================================================
echo.
echo As fotos agora estao nomeadas:
echo foto001.jpg, foto002.jpg, foto003.jpg...
echo.
echo PROXIMO PASSO:
echo 1. Feche este terminal
echo 2. Abra o diagnostico-completo.html novamente
echo 3. Verifique se as fotos aparecem
echo 4. Se aparecerem, abra o site principal!
echo.
pause
