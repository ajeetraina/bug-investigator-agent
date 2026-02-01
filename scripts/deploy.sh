#!/bin/bash

# Deploy Bug Investigator to DigitalOcean
# Usage:
#   export DO_TOKEN=your_token
#   export DOCKER_USER=your_dockerhub_username
#   export ANTHROPIC_API_KEY=your_key  # or OPENAI_API_KEY
#   ./scripts/deploy.sh

set -e

echo "🚀 Deploying Bug Investigator to DigitalOcean..."

# Check prerequisites
[ -z "$DO_TOKEN" ] && echo "❌ DO_TOKEN not set" && exit 1
[ -z "$DOCKER_USER" ] && echo "❌ DOCKER_USER not set" && exit 1

# Push agent to Docker Hub
AGENT_IMAGE="docker.io/${DOCKER_USER}/bug-investigator:latest"
echo "📦 Pushing agent to ${AGENT_IMAGE}..."
cagent push ./cagent.yaml ${AGENT_IMAGE}

# Create DigitalOcean droplet
echo "☁️ Creating DigitalOcean droplet..."
RESPONSE=$(curl -s -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${DO_TOKEN}" \
  -d "{
    \"name\": \"bug-investigator-$(date +%s)\",
    \"region\": \"sfo3\",
    \"size\": \"s-2vcpu-4gb\",
    \"image\": \"cagent\"
  }" \
  "https://api.digitalocean.com/v2/droplets")

echo "✅ Droplet created!"
echo "$RESPONSE" | jq .
