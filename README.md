# 🐛 Bug Investigator Agent + Docker cagent

A multi-agent debugging system built with [Docker cagent](https://github.com/docker/cagent) that helps developers diagnose and fix code issues.

## 🎯 Features

- **Multi-Agent Architecture**: Specialized agents for investigation, research, fixing, and testing
- **Multiple Model Support**: Works with OpenAI, Anthropic, or local models (Docker Model Runner)
- **MCP Tools Integration**: Web search via DuckDuckGo, filesystem access
- **Production Ready**: Deploy to DigitalOcean with one click

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                   BUG INVESTIGATOR (Root)                    │
│                   Analyzes & Coordinates                     │
└─────────────────────┬───────────────────────────────────────┘
                      │
        ┌─────────────┼─────────────┐
        ▼             ▼             ▼
┌───────────────┐ ┌───────────┐ ┌───────────┐
│  RESEARCHER   │ │   FIXER   │ │  TESTER   │
│  Web Search   │ │  Writes   │ │ Validates │
│  Find Docs    │ │   Code    │ │  & Tests  │
└───────────────┘ └───────────┘ └───────────┘
```

## 🚀 Quick Start

### Prerequisites

- Docker Desktop 4.49+ (includes cagent)
- API key: `ANTHROPIC_API_KEY` or `OPENAI_API_KEY`

### Run Locally

```bash
# Clone the repo
git clone https://github.com/ajeetraina/bug-investigator-agent.git
cd bug-investigator-agent

# Set your API key
export OPENAI_API_KEY=your_key_here

# Run the agent
cagent run ./cagent-openai.yaml
```

### Test It

Paste this into the agent:

```
I'm getting this error:

TypeError: 'NoneType' object is not subscriptable
  File "app.py", line 8, in get_user_name
    return response.json()['data']['user']['name']

def get_user_name(user_id):
    response = requests.get(f"https://api.example.com/users/{user_id}")
    return response.json()['data']['user']['name']
```

Or run from test-code directory to use filesystem:

```bash
cd test-code
cagent run ../cagent-openai.yaml

# Then ask:
> Read app.py and find all the bugs
```

## 📁 Project Structure

```
bug-investigator-agent/
├── cagent.yaml           # Main config (Anthropic + OpenAI)
├── cagent-openai.yaml    # OpenAI-only version
├── cagent-local.yaml     # Local models (no API key)
├── test-code/            # Sample buggy code for testing
│   ├── app.py            # Python bugs
│   ├── index.js          # JavaScript bugs
│   ├── main.go           # Go bugs
│   ├── Dockerfile        # Docker issues
│   └── deployment.yaml   # Kubernetes issues
├── examples/
│   └── bug-scenarios.md  # Copy-paste test scenarios
└── scripts/
    └── deploy.sh         # DigitalOcean deployment
```

## 🌐 Deploy to Production

### Push to Docker Hub

```bash
cagent push ./cagent.yaml docker.io/YOUR_USERNAME/bug-investigator:latest
```

### Deploy to DigitalOcean

1. Go to [DigitalOcean Marketplace - cagent](https://marketplace.digitalocean.com/apps/cagent)
2. Create a droplet
3. SSH in and run:

```bash
export OPENAI_API_KEY=your_key
cagent run docker.io/YOUR_USERNAME/bug-investigator:latest
```

## 🔧 Customization

### Use Local Models (No API Key)

```bash
# Pull a model
docker model pull ai/gemma3:2B-Q4_0

# Run locally
cagent run ./cagent-local.yaml
```

### Add More Tools

Edit cagent.yaml to add tools:

```yaml
toolsets:
  - type: mcp
    ref: docker:github    # GitHub integration
  - type: mcp
    ref: docker:slack     # Slack notifications
```

## 📚 Resources

- [cagent Documentation](https://docs.docker.com/ai/cagent/)
- [cagent GitHub](https://github.com/docker/cagent)
- [MCP Toolkit](https://docs.docker.com/ai/mcp-toolkit/)
- [DigitalOcean cagent App](https://marketplace.digitalocean.com/apps/cagent)


