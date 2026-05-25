#!/bin/bash 

sudo apt update -y
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

echo "Nginx installation and setup completed successfully!" | sudo tee /var/www/html/index.html
