# Read PreToolUse payload from stdin
$rawInput = [Console]::In.ReadToEnd()
if (-not $rawInput) {
    Write-Output '{"decision": "allow"}'
    exit 0
}

try {
    $inputJson = $rawInput | ConvertFrom-Json
} catch {
    Write-Output '{"decision": "allow"}'
    exit 0
}

$targetPath = $inputJson.toolCall.args.Path
if (-not $targetPath) {
    Write-Output '{"decision": "allow"}'
    exit 0
}

# Normalize path separators
$normPath = $targetPath.Replace('\', '/')

# Only inspect Markdown files; allow all non-markdown files immediately
if ($normPath -notmatch '\.(md|markdown)$') {
    Write-Output '{"decision": "allow"}'
    exit 0
}

# Allowlist criteria:
# 1. Agent instruction root files (AGENTS.md, GEMINI.md, CLAUDE.md)
# 2. Rules directories (.agents/rules/ or rules/)
# 3. Scratchpad and brain conversation artifacts
$fileName = Split-Path -Leaf $targetPath
$isAllowed = ($fileName -in @('AGENTS.md', 'GEMINI.md', 'CLAUDE.md')) -or
             ($normPath -match '(^|/)(\.agents/)?rules/') -or
             ($normPath -match '(^|/)(brain|\.gemini)/')

if ($isAllowed) {
    Write-Output '{"decision": "allow"}'
} else {
    Write-Output '{"decision": "ask", "reason": "Target is a human-facing Markdown file. Direct writes require explicit user confirmation."}'
}
