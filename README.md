# ⚡️ Bugster <> Claude Code

## Quick Start

### Step 1: Add the Marketplace

**Option A: Add directly from GitHub** (recommended for most users)

In Claude Code, run:

```
/plugin marketplace add git@github.com:Bugsterapp/bugster-claude-marketplace.git
```

**Option B: Add from local directory** (for development)

1. Clone the repository:

```bash
git clone https://github.com/Bugsterapp/bugster-claude-marketplace.git
```

2. Add the local marketplace:

```
/plugin marketplace add /absolute/path/to/bugster-claude-marketplace
```

> **Note:** Either approach makes all plugins in this marketplace available for installation, but does not automatically load any agents or tools into your context.

### Step 2: Install Plugins

Install the Bugster plugin:

```
/plugin install bugster-claude-plugin@bugster-claude-marketplace
```

**Important:** You'll need to restart Claude Code for the plugin to take effect.

### Step 3: Start Using Bugster

Once installed and restarted, you can access Bugster's testing capabilities through Claude Code's plugin commands and agents.
