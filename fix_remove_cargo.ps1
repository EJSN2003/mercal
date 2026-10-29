$file = "js\trabajador.js"
$content = Get-Content $file -Raw -Encoding UTF8

# Eliminar la línea de cargo en INCLUIR
$content = $content -replace "`t`t`t`tdatos\.append\('cargo',\$\(`"#cargo`"\)\.val\(\)\);`n", ""

# Eliminar la línea de cargo en MODIFICAR
$content = $content -replace "`t`t`t`tdatos\.append\('cargo',\$\(`"#cargo`"\)\.val\(\)\);`n", ""

Set-Content $file -Value $content -Encoding UTF8 -NoNewline
Write-Host "Líneas de cargo eliminadas del JavaScript"
