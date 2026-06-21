$source = "D:\Project XT\paradigm\style.css.bak"
$lines = Get-Content $source

Function Write-Lines($start, $end, $dest) {
    # start and end are 1-based, $lines is 0-based
    $chunk = $lines[($start-1)..($end-1)]
    Out-File -FilePath "D:\Project XT\paradigm\$dest" -InputObject $chunk -Append -Encoding utf8
}

$files = @(
    "css\core.css",
    "css\layout.css",
    "css\components\sidebar.css",
    "css\components\tables.css",
    "css\components\forms.css",
    "css\components\modals.css",
    "css\pages\admin.css",
    "css\pages\login.css"
)
foreach ($f in $files) {
    New-Item -ItemType File -Force -Path "D:\Project XT\paradigm\$f" | Out-Null
}

Write-Lines 1 124 "css\core.css"
Write-Lines 125 386 "css\layout.css"
Write-Lines 387 445 "css\layout.css"
Write-Lines 446 481 "css\core.css"
Write-Lines 482 554 "css\layout.css"
Write-Lines 555 643 "css\layout.css"
Write-Lines 644 677 "css\layout.css"
Write-Lines 678 738 "css\components\forms.css"
Write-Lines 739 970 "css\layout.css"
Write-Lines 971 1002 "css\core.css"
Write-Lines 1003 1067 "css\layout.css"
Write-Lines 1068 1201 "css\components\sidebar.css"
Write-Lines 1202 1437 "css\pages\admin.css"
Write-Lines 1438 1483 "css\core.css"
Write-Lines 1484 1556 "css\pages\admin.css"
Write-Lines 1557 1640 "css\components\tables.css"
Write-Lines 1641 1754 "css\components\forms.css"
Write-Lines 1755 1817 "css\components\modals.css"
Write-Lines 1818 1875 "css\components\forms.css"
Write-Lines 1876 1930 "css\core.css"
Write-Lines 1931 1966 "css\core.css"
Write-Lines 1967 2220 "css\pages\login.css"
Write-Lines 2221 2275 "css\core.css"
Write-Lines 2276 2323 "css\layout.css"
Write-Lines 2324 2357 "css\core.css"
Write-Lines 2358 2497 "css\components\tables.css"
Write-Lines 2498 2566 "css\components\modals.css"
Write-Lines 2567 2678 "css\components\forms.css"
Write-Lines 2679 2746 "css\layout.css"
Write-Lines 2747 2856 "css\core.css"
Write-Lines 2857 3067 "css\layout.css"

$imports = @"
@import url("css/core.css");
@import url("css/layout.css");
@import url("css/components/sidebar.css");
@import url("css/components/tables.css");
@import url("css/components/forms.css");
@import url("css/components/modals.css");
@import url("css/pages/admin.css");
@import url("css/pages/login.css");
"@

Out-File -FilePath "D:\Project XT\paradigm\style.css" -InputObject $imports -Encoding utf8
