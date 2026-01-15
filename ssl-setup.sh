#!/bin/bash
# ssl-setup.sh — Automate Let's Encrypt SSL setup for Passbolt on Ubuntu

echo "Starting SSL setup for Passbolt..."

# Step 1: Update system
sudo apt update && sudo apt upgrade -y

# Step 2: Install Certbot and Nginx plugin
sudo apt install certbot python3-certbot-nginx -y

# Step 3: Stop Apache if running (Passbolt uses Nginx)
sudo systemctl stop apache2 2>/dev/null || true

# Step 4: Configure Nginx for HTTPS
DOMAIN="passbolt.local"  # Use your domain or 'passbolt.local' for lab
EMAIL="you@example.com"  # Use your real email for notifications

# Step 5: Run Certbot to obtain and install certificate
sudo certbot --nginx \
  --non-interactive \
  --agree-tos \
  --email "$EMAIL" \
  -d "$DOMAIN" \
  --redirect

# Step 6: Verify SSL configuration
sudo nginx -t && sudo systemctl reload nginx

# Step 7: Enable automatic renewal
sudo certbot renew --dry-run

echo "SSL setup complete!"
echo "Access Passbolt securely at: https://$DOMAIN"
