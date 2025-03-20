echo "Updating and upgrading system packages..."
sudo apt update && sudo apt upgrade -y

# Install essential packages in one go
echo "Installing essential packages..."
sudo apt-get install -y docker.io curl wget git stress

# Add current user to the Docker group and refresh group settings
echo "Adding user to Docker group..."
sudo usermod -aG docker $USER

# Start Docker service if it's not running
echo "Starting Docker service..."
sudo systemctl start docker

# Clone the AWS projects repository
echo "Cloning the AWS projects repository..."
git clone https://github.com/sinzn/Aws-projects.git
cd Aws-projects/

# Build Docker image for the British app
echo "Building Docker image for British App..."
docker build -t british-app .

# Run Docker container for the British app
echo "Running British App Docker container..."
docker run -d -p 80:80 british-app

echo "Deployment script executed successfully!"
