# ⚡️ Bugster <> Claude Code

## Quick Start

### Step 1: Add the Marketplace

Add this marketplace to Claude Code, either from GitHub:

```
/plugin marketplace add git@github.com:Bugsterapp/bugster-claude-marketplace.git
```

or locally:

```
git clone https://github.com/Bugsterapp/bugster-claude-marketplace.git
/plugin marketplace add absolute/path/to/the/directory
```

This makes all plugins available for installation, but does not load any agents or tools into your context.

### Step 2: Install Plugins

Browse available plugins:

```

/plugin install bugster-claude-plugin@bugster-claude-marketplace

```

You’ll then need to restart Claude Code in order to use the new plugin.
