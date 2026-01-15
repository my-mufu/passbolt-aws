# Passbolt Password Manager on AWS  
### Self-Hosted, End-to-End Encrypted Credential Management — Built with Zero Trust

> As an **ISC² Certified in Cybersecurity (CC)** professional, I deployed this production-grade password manager to enforce **data sovereignty**, **encryption everywhere**, and **secure recovery workflows**—with no third-party trust.

![Passbolt Dashboard](images/passbolt-dashboard.png)

## Overview

I architected and hardened a **self-hosted Passbolt instance** on AWS EC2 to replace insecure password sharing (e.g., spreadsheets, chat). This solution enforces:
- **End-to-end encryption** (client-side GPG)
- **HTTPS-only access** (Let’s Encrypt SSL/TLS)
- **Secure account recovery** via SMTP (Gmail App Passwords)
- **Zero plaintext exposure** — even during setup

> ⚠️ **Critical Security Principle**: I refused to use HTTP at any stage—preventing master password leakage in transit.

## Features I Implemented Securely
- 🔒 **End-to-end encrypted secrets** (GPG-based)
- 📧 **SMTP integration** for MFA, recovery emails, and security alerts
- 🔄 **Automated password generation** with strong entropy
- 🗝️ **Offline recovery kit** backup (stored securely)
- 🌐 **HTTPS/SSL enforcement** via Let’s Encrypt (configured before first login)
- 🛡️ **Least-privilege AWS Security Groups** (SSH restricted to my IP)

## Prerequisites I Used
- AWS Account (Free Tier)
- Local Ubuntu VM (for SSH key management)
- Free dynamic DNS (`mufubaba.dpdns.org`) — no public domain cost

## My Secure Deployment Steps

### 1. Launched Passbolt on AWS:
- Selected **Passbolt Community Edition AMI**
- Created **dedicated key pair** (`passbolt-project-key.pem`)
- Configured **Security Groups**: SSH (my IP only), HTTPS (global)

### 2. Enforced HTTPS Before First Access:
- Edited local `hosts` file to bypass DNS delays
- Ran `passbolt-configure --ssl=auto` to install Let’s Encrypt cert
- **Never accessed via HTTP** — even temporarily

### 3. Configured SMTP for Recovery & MFA:
- Created **dedicated Gmail account** for labs
- Enabled **2FA** → generated **16-char App Password**
- Set TLS=ON in Passbolt SMTP settings

### 4. Completed Setup with Hardening:
- Generated **strong master password** (15+ chars)
- Downloaded **recovery kit** → stored offline
- Installed **browser extension** for client-side encryption

## Screenshots: Proof of Secure Execution

![Passbolt Dashboard](images/passbolt-dashboard.png)  
*✅ Fully deployed over HTTPS — green padlock visible*

![AWS Security Group Settings](images/aws-security-group.png)  
*🛡️ SSH restricted to admin IP only — least privilege enforced*

![SSL/TLS Certificate Details](images/ssl-certificate.png)  
*🔐 Valid Let’s Encrypt certificate — no self-signed certs*

![SMTP Setup Confirmation](images/smtp-configuration.png)  
*📧 SMTP configured with TLS — enabling MFA and recovery*

## Why This Matters for Employers

This project demonstrates hands-on skills in:
- **Cloud Security**: AWS EC2, Security Groups, IAM best practices  
- **DevSecOps**: Automated SSL, reproducible config, secure SMTP  
- **Identity & Access Management**: MFA, recovery workflows, zero-trust auth  
- **Compliance Alignment**: Meets NIST/ISO 27001 requirements for credential management  

> 💡 **Relevant for roles**: Cloud Security Analyst, DevSecOps Engineer, SOC Analyst, Security Engineer

## Contributing

While this is a personal project, I welcome feedback on security improvements! Open an issue to discuss.

## License

Passbolt Community Edition is licensed under [GNU GPL v2+](https://www.passbolt.com/legal/terms).  
My deployment scripts and documentation are open for educational use.
