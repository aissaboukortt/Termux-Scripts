# Define the project directory
$PROJECT_DIR = "$env:USERPROFILE\cam-capture"

Write-Host "📦 Installing the project..."

# Clone the GitHub repository
git clone https://github.com/aissaboukortt/Termux-Scripts.git $PROJECT_DIR

# Navigate to the project directory
Set-Location $PROJECT_DIR

# Check if Python is installed
if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Python not found. Please install Python and try again."
    exit
}

# Install Flask
pip install flask

# Create folders
New-Item -ItemType Directory -Force -Path "$PROJECT_DIR\images"
New-Item -ItemType Directory -Force -Path "$PROJECT_DIR\metadata"

Write-Host "✅ Installation completed successfully!"
Write-Host "🚀 To run the server: cd $PROJECT_DIR && python app.py"
Write-Host "🌍 To expose it, install Cloudflare Tunnel manually: https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/installation/"
