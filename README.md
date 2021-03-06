# Organizar fotos - Script em PowerShell

Script feito em powershell para organizar fotos baseados em metadados de data de criação.

Move os arquivos para pastas baseada na data da foto, as pastas serão criadas neste formato "YYYY\MM\DD".

Útil para organizar pastas com várias fotos que estão esquecidas no PC.

Modo de uso

```
.\orgPhotos.ps1 [pastaDeOrigem] [pastaDeDestino] [-debugMode]
```

## Parametros de entradas

### pastaDeOrigem
- Opcional
- Valor padrão é a pasta atual (".\")
- Deve ser informado no seguinte formado "C:\Nome\Da\Pasta"

```
.\orgPhotos.ps1 "C:\Nome\Da\Pasta"
```

### pastaDeDestino
- Opcional
- Valor padrão é o valor de pastaDeOrigem
- Deve ser informado no seguinte formado "C:\Nome\Outra\Pasta"

```
.\orgPhotos.ps1 "C:\Nome\Da\Pasta" "C:\Nome\Outra\Pasta"
```

### debugMode
- Opcional
- Se o valor 1 for informado, somente vai listar os arquivos e não executar a ação.

```
.\orgPhotos.ps1 -debugMode 1
```

```
.\orgPhotos.ps1 "C:\Nome\Da\Pasta"  -debugMode 1
```
```
.\orgPhotos.ps1 "C:\Nome\Da\Pasta" "C:\Nome\Outra\Pasta"  -debugMode 1
```