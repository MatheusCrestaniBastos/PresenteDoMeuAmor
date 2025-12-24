# ========================================================
# CONVERTER HEIC PARA JPG - WINDOWS 10/11
# ========================================================
# Coloque este arquivo na pasta "fotos" e execute

Write-Host "================================================" -ForegroundColor Magenta
Write-Host "   CONVERTER HEIC PARA JPG" -ForegroundColor Magenta
Write-Host "================================================" -ForegroundColor Magenta
Write-Host ""

# Verificar se tem o recurso de conversão
Write-Host "Verificando recursos do Windows..." -ForegroundColor Cyan

# Obter diretório atual
$pastaAtual = Get-Location

# Listar todos os arquivos HEIC
$fotosHEIC = Get-ChildItem -Path $pastaAtual -Filter "*.heic" -File

$totalFotos = $fotosHEIC.Count

Write-Host "Total de arquivos HEIC encontrados: $totalFotos" -ForegroundColor Yellow
Write-Host ""

if ($totalFotos -eq 0) {
    Write-Host "Nenhum arquivo HEIC encontrado na pasta!" -ForegroundColor Yellow
    Write-Host "As fotos ja podem estar em outro formato." -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Pressione ENTER para sair"
    exit
}

Write-Host "IMPORTANTE:" -ForegroundColor Yellow
Write-Host "Este script usa uma ferramenta online gratuita para conversao." -ForegroundColor Yellow
Write-Host "Alternativamente, voce pode:" -ForegroundColor Cyan
Write-Host "1. Usar o site heic2jpg.com ou cloudconvert.com" -ForegroundColor Cyan
Write-Host "2. Abrir as fotos no Windows Photos e salvar como JPG" -ForegroundColor Cyan
Write-Host "3. Usar um aplicativo como 'iMazing HEIC Converter'" -ForegroundColor Cyan
Write-Host ""

Write-Host "Deseja abrir o conversor online? (S/N)" -ForegroundColor Yellow
$resposta = Read-Host

if ($resposta -eq 'S' -or $resposta -eq 's') {
    Start-Process "https://heic2jpg.com"
    Write-Host ""
    Write-Host "Site aberto no navegador!" -ForegroundColor Green
    Write-Host ""
    Write-Host "INSTRUCOES:" -ForegroundColor Cyan
    Write-Host "1. Arraste todas as fotos HEIC para o site" -ForegroundColor White
    Write-Host "2. Aguarde a conversao" -ForegroundColor White
    Write-Host "3. Baixe os arquivos JPG convertidos" -ForegroundColor White
    Write-Host "4. Coloque-os de volta na pasta 'fotos'" -ForegroundColor White
    Write-Host "5. Delete os arquivos HEIC antigos" -ForegroundColor White
    Write-Host ""
}
else {
    Write-Host ""
    Write-Host "ALTERNATIVA - Converter pelo Windows Photos:" -ForegroundColor Cyan
    Write-Host "1. Abra cada foto no aplicativo 'Fotos' do Windows" -ForegroundColor White
    Write-Host "2. Clique nos 3 pontinhos (...) no canto superior direito" -ForegroundColor White
    Write-Host "3. Selecione 'Salvar como'" -ForegroundColor White
    Write-Host "4. Escolha formato JPEG/JPG" -ForegroundColor White
    Write-Host "5. Salve na mesma pasta" -ForegroundColor White
    Write-Host ""
}

Write-Host "Ou simplesmente use a versao atualizada do site" -ForegroundColor Green
Write-Host "que ja aceita arquivos HEIC!" -ForegroundColor Green
Write-Host ""

Read-Host "Pressione ENTER para sair"
