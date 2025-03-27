#!/bin/bash

# Updated Deployment script for Alpin Royal Casino Management System
# This script will install all dependencies, extract the package, and set up the system

set -e  # Exit on error

echo "===== Alpin Royal Casino Management System Deployment ====="
echo "Starting deployment process..."

# Step 1: Update system and install dependencies
echo "Step 1: Installing dependencies..."
sudo apt update
sudo apt install -y docker.io docker-compose unzip git curl python3 python3-pip

# Step 2: Start Docker service
echo "Step 2: Starting Docker service..."
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
echo "Note: You may need to log out and back in for group changes to take effect"

# Step 3: Extract the package
echo "Step 3: Extracting the Alpin Royal package..."
cd /home/devuser
if [ ! -d "alpin_royal_system" ]; then
    mkdir -p alpin_royal_system
fi
unzip -o alpin_royal_system_v1.0.0.zip -d alpin_royal_system
cd alpin_royal_system

# Step 4: Configure environment
echo "Step 4: Configuring environment..."
cp /home/devuser/alpin_royal.env .env
echo "Using provided .env file"

# Step 5: Build and start Docker containers
echo "Step 5: Building and starting Docker containers..."
docker-compose up -d

# Step 6: Initialize the database
echo "Step 6: Initializing the database..."
sleep 10  # Wait for containers to be fully up
docker-compose exec -T app python -m scripts.database.init_db

# Step 7: Load test data
echo "Step 7: Loading test data..."
docker-compose exec -T app python -m scripts.test_data.load_test_data

echo "===== Deployment Complete ====="
echo "The Alpin Royal Casino Management System is now running!"
echo "You can access the web interface at: http://$(hostname -I | awk '{print $1}'):8000"
echo "Default admin credentials:"
echo "  Username: admin"
echo "  Password: admin123"
echo "Please change these credentials immediately after your first login."
echo "For detailed instructions, please refer to the Installation Guide in the docs directory."
