#!/bin/bash

# Define the project directory
PROJECT_DIR="$HOME/cam-capture"

echo "📦 Installing the project..."

# Clone the GitHub repository
git clone https://github.com/aissaboukortt/Termux-Scripts.git "$PROJECT_DIR"

# Enter project directory
cd "$PROJECT_DIR" || exit

# Install dependencies
if command -v apt &>/dev/null; then
    sudo apt update
    sudo apt install -y python3 python3-pip
elif command -v brew &>/dev/null; then
    brew install python3
else
    echo "❌ Package manager not supported. Install Python manually."
    exit 1
fi

# Install Flask
pip3 install flask

# Download cloudflared
if ! command -v cloudflared &>/dev/null; then
    curl -LO https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
    chmod +x cloudflared-linux-amd64
    sudo mv cloudflared-linux-amd64 /usr/local/bin/cloudflared
fi

# Create necessary folders
mkdir -p images metadata

# Make app.py executable
chmod +x app.py

echo "✅ Installation completed successfully!"
echo "🚀 To run the server: cd $PROJECT_DIR && python3 app.py"
echo "🌍 To expose it: cloudflared tunnel --url http://localhost:5000"
