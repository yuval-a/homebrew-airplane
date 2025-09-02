# 🛫 Airplane - an AI driven terminal REPL
Ask your OS questions, give it instructions - get back direct OS commands to run (with your approval) to achieve your results.

# Features
* Built with Bash
* LLM Provider agnostic: choose your favorite LLM: Open AI, Anthropic (Claude) or Google Gemini. Use your own API key.
* Automatically detects your OS type.
* Fast, concise.
* Session history with local caching
* Asks clarifying questions if needed.
* Supports multi-turn, step-by-step commands, when needed.

# Compatibility
- macOS: supported on Terminal/iTerm2 with system bash (3.2+) or Homebrew bash (recommended).
Dependencies: jq, curl.
- Linux: supported on common distros/shells. Dependencies: jq, curl.
- Windows (WSL2): fully supported. Install jq/curl inside WSL and run there.
- Windows (Git Bash/MSYS2): supported with minor caveats. Ensure jq and curl are in PATH. If the
spinner flickers, use :spinner OFF.
- Windows (PowerShell/CMD): not supported natively. Use WSL2 or Git Bash.

# Install
To install run: 
```brew install yuval-a/airplane/airplane```
