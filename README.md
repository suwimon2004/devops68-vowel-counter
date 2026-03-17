# Vowel Counter API

Count vowels and consonants in text.

## Endpoint

### GET `/count`

**Parameters:**
- `text` (required): Text to analyze

**Example Request:**
```
http://localhost:3012/count?text=hello
```

**Example Response:**
```json
{
  "text": "hello",
  "vowels": 2,
  "consonants": 3
}
# 📋 Deployment Guide (Quiz)

This section details the steps taken to provision infrastructure and deploy the Vowel Counter API.

## 🏗️ 1. Infrastructure Provisioning (2 Points)
I used Terraform to automate the creation of the cloud environment on Azure:

1. **Initialize Terraform:** Navigate to the terraform directory and initialize the providers.
   ```powershell
   cd terraform
   terraform init
```
