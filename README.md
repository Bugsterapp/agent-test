# ⚡️ Bugster <> Claude Code

## Quick Start

### Step 1: Add the Marketplace

Add this marketplace to Claude Code:

1. From GitHub

```
/plugin marketplace add git@github.com:Bugsterapp/bugster-claude-marketplace.git
```

2. Locally

```
/plugin marketplace add absolute/path/to/the/directory
```

This makes all plugins available for installation, but does not load any agents or tools into your context.

### Step 2: Install Plugins

Browse available plugins:

```

/plugin install bugster-claude-plugin@bugster-claude-marketplace

```

You’ll then need to restart Claude Code in order to use the new plugin.
