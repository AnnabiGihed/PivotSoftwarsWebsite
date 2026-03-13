# download-images.ps1
# Run from your project root: .\download-images.ps1

$assetsDir = "assets\images"
New-Item -ItemType Directory -Force -Path $assetsDir | Out-Null

Write-Host "Downloading external images..." -ForegroundColor Cyan

$images = @(
    @{
        Url  = "https://images.pexels.com/photos/7097290/pexels-photo-7097290.jpeg?cs=srgb&w=1400&fm=jpg"
        File = "$assetsDir\industrial-hero.jpg"
        Name = "industrial-hero.jpg"
    },
    @{
        Url  = "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?auto=format&fit=crop&w=1400&q=80"
        File = "$assetsDir\fintech-hero.jpg"
        Name = "fintech-hero.jpg"
    },
    @{
        Url  = "https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&w=1400&q=80"
        File = "$assetsDir\about-hero.jpg"
        Name = "about-hero.jpg"
    },
    @{
        Url  = "https://images.unsplash.com/photo-1521737604893-d14cc237f11d?auto=format&fit=crop&w=1400&q=80"
        File = "$assetsDir\insights-hero.jpg"
        Name = "insights-hero.jpg"
    },
    @{
        Url  = "https://images.pexels.com/photos/13138090/pexels-photo-13138090.jpeg?cs=srgb&w=1400&fm=jpg"
        File = "$assetsDir\public-sector-hero.jpg"
        Name = "public-sector-hero.jpg"
    },
    @{
        Url  = "https://images.unsplash.com/photo-1544723795-3fb6469f5b39?auto=format&fit=crop&w=1200&q=80"
        File = "$assetsDir\team-delivery.jpg"
        Name = "team-delivery.jpg"
    },
    @{
        Url  = "https://images.unsplash.com/photo-1543269865-cbf427effbad?auto=format&fit=crop&w=1200&q=80"
        File = "$assetsDir\team-engineering.jpg"
        Name = "team-engineering.jpg"
    }
)

foreach ($img in $images) {
    try {
        Invoke-WebRequest -Uri $img.Url -OutFile $img.File -UseBasicParsing
        Write-Host "  OK  $($img.Name)" -ForegroundColor Green
    }
    catch {
        Write-Host "  FAIL  $($img.Name): $_" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "All images saved to $assetsDir\" -ForegroundColor Cyan
Write-Host ""
Write-Host "IMAGE PATH REPLACEMENTS TO APPLY IN YOUR HTML:" -ForegroundColor Yellow
Write-Host "================================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "In root pages (index.html, about.html, insights.html):" -ForegroundColor White
Write-Host '  pexels-photo-7097290...  ->  assets/images/industrial-hero.jpg'
Write-Host '  photo-1454165804606...   ->  assets/images/fintech-hero.jpg'
Write-Host '  photo-1522071820081...   ->  assets/images/about-hero.jpg'
Write-Host '  photo-1521737604893...   ->  assets/images/insights-hero.jpg'
Write-Host ""
Write-Host "In sector pages (sectors/*.html):" -ForegroundColor White
Write-Host '  pexels-photo-7097290...  ->  ../assets/images/industrial-hero.jpg'
Write-Host '  photo-1454165804606...   ->  ../assets/images/fintech-hero.jpg'
Write-Host '  pexels-photo-13138090... ->  ../assets/images/public-sector-hero.jpg'
Write-Host ""
Write-Host "Done!" -ForegroundColor Green