# suwupnil/homebrew-tap

Official Homebrew tap for **newNewton** — Campus enhancer & LMS MCP Server for Newton School of Technology (NST).

## Installation

Install the newNewton MCP server:

```bash
brew install suwupnil/tap/newnewton
```

Alternatively, tap the repository first:

```bash
brew tap suwupnil/tap
brew install newnewton
```

To update in the future:

```bash
brew update
brew upgrade newnewton
```

## Quick Start & Setup

After installation, run `newnewton` in your terminal to complete initial configuration:

```bash
newnewton
```

The first-time setup will prompt you for your Newton LMS auth-token (which can be copied from the newNewton browser extension popup under Settings). It will verify the token and automatically configure your MCP clients (Cursor, Claude Desktop, Windsurf, Claude Code).

You can also run non-interactive setup directly:

```bash
newnewton setup <AUTH_TOKEN>
```

## AI Agent Installation Prompt

You can prompt your AI coding agent (Claude Code, Cursor, Windsurf, Cline) to install this MCP server directly:

> "Install the newNewton MCP server: run `brew install suwupnil/tap/newnewton`, then run `newnewton setup <AUTH_TOKEN>` using my auth-token from the newNewton browser extension to configure my MCP environment automatically."
