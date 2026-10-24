#!/usr/bin/env bash
set -euo pipefail

# Read PreToolUse payload from stdin
raw_input="$(cat)"

if [ -z "$raw_input" ]; then
    echo '{"decision": "allow"}'
    exit 0
fi

# Extract Path using python3, jq, node, or grep/sed
extract_path() {
    if command -v python3 >/dev/null 2>&1; then
        echo "$raw_input" | python3 -c 'import sys, json; data=json.load(sys.stdin); print(data.get("toolCall", {}).get("args", {}).get("Path", ""))' 2>/dev/null && return 0
    elif command -v jq >/dev/null 2>&1; then
        echo "$raw_input" | jq -r '.toolCall.args.Path // empty' 2>/dev/null && return 0
    elif command -v node >/dev/null 2>&1; then
        echo "$raw_input" | node -e 'let d="";process.stdin.on("data",c=>d+=c);process.stdin.on("end",()=>{try{console.log(JSON.parse(d).toolCall?.args?.Path||"")}catch{console.log("")}})' 2>/dev/null && return 0
    else
        echo "$raw_input" | grep -o '"Path"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*"Path"[[:space:]]*:[[:space:]]*"//;s/"$//'
    fi
}

target_path="$(extract_path)"

if [ -z "$target_path" ]; then
    echo '{"decision": "allow"}'
    exit 0
fi

# Normalize path separators to forward slashes
norm_path="${target_path//\\//}"

# Only inspect Markdown files; allow all non-markdown files immediately
case "$norm_path" in
    *.md|*.markdown)
        ;;
    *)
        echo '{"decision": "allow"}'
        exit 0
        ;;
esac

# Allowlist criteria:
# 1. Agent instruction root files (AGENTS.md, GEMINI.md, CLAUDE.md)
# 2. Rules directories (.agents/rules/ or rules/)
# 3. Scratchpad and brain conversation artifacts
file_name="${norm_path##*/}"

if [[ "$file_name" == "AGENTS.md" || "$file_name" == "GEMINI.md" || "$file_name" == "CLAUDE.md" ]]; then
    echo '{"decision": "allow"}'
    exit 0
fi

if [[ "$norm_path" =~ (^|/)(\.agents/)?rules/ || "$norm_path" =~ (^|/)(brain|\.gemini)/ ]]; then
    echo '{"decision": "allow"}'
    exit 0
fi

# Target is a human-facing Markdown file
echo '{"decision": "ask", "reason": "Target is a human-facing Markdown file. Direct writes require explicit user confirmation."}'
