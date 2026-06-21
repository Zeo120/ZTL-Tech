param (
    [string]$FilePath,
    [string]$MatchPattern
)

$content = Get-Content $FilePath -Raw
$lines = $content -split "`r?`n"

$startIndex = -1
$endIndex = -1

for ($i = 0; $i -lt $lines.Length; $i++) {
    if ($lines[$i] -match $MatchPattern -and $lines[$i] -match "0000") {
        if ($startIndex -eq -1) {
            # Usually preceded by some comment block, let's just break exactly at the first proc/label
            while ($lines[$i-1] -match "^;") { $i-- }
            $startIndex = $i
            break
        }
    }
}

if ($startIndex -eq -1) {
    Write-Host "Pattern not found in $FilePath"
    exit
}

# The end index is either the end of the file or before an `END` statement
for ($i = $lines.Length - 1; $i -ge $startIndex; $i--) {
    if ($lines[$i] -match "^\s*END\s*$") {
        $endIndex = $i - 1
        break
    }
}

if ($endIndex -eq -1) {
    $endIndex = $lines.Length - 1
}

$funcLines = $lines[$startIndex..$endIndex]
$numChunks = 10
$chunkSize = [math]::Ceiling($funcLines.Length / $numChunks)

$dir = Split-Path $FilePath
$baseName = [System.IO.Path]::GetFileNameWithoutExtension($FilePath)
$ext = [System.IO.Path]::GetExtension($FilePath)
$isMasm = ($ext -eq ".asm")

$includes = @()

for ($c = 0; $c -lt $numChunks; $c++) {
    $start = $c * $chunkSize
    $end = ($c + 1) * $chunkSize - 1
    if ($end -ge $funcLines.Length) {
        $end = $funcLines.Length - 1
    }
    
    if ($start -le $end) {
        $chunkName = "${baseName}_chunk_0${c}${ext}"
        $chunkPath = Join-Path $dir $chunkName
        Set-Content -Path $chunkPath -Value ($funcLines[$start..$end] -join "`r`n")
        
        if ($isMasm) {
            $includes += "INCLUDE $chunkName"
        } else {
            $includes += ".include `"$chunkName`""
        }
    }
}

$newContent = ($lines[0..($startIndex-1)] -join "`r`n") + "`r`n" + ($includes -join "`r`n") + "`r`n" + ($lines[($endIndex+1)..($lines.Length-1)] -join "`r`n")

Set-Content -Path $FilePath -Value $newContent

Write-Host "Successfully chunked $FilePath into 10 files!"
