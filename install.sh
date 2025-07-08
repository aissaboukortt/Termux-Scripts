#!/bin/bash

# Define the project installation directory
PROJECT_DIR="$HOME/cam-capture"

# Start installation
echo "📦 Installing the project..."

# Clone the GitHub repository
git clone https://github.com/aissaboukortt/Termux-Scripts.git $PROJECT_DIR

# Enter the project directory
cd $PROJECT_DIR || exit

# Install Python and Flask
pkg install -y python
pip install flask

# Install cloudflared
pkg install -y cloudflared || curl -s https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm -o cloudflared && chmod +x cloudflared && mv cloudflared $PREFIX/bin/

# Create necessary folders
mkdir -p images
mkdir -p metadata

# Make app.py executable
chmod +x app.py

# Done
echo "✅ Installation completed successfully!"
echo "🚀 To run the server: cd $PROJECT_DIR && python app.py"
echo "🌍 To expose it: cloudflared tunnel --url http://localhost:5000"
