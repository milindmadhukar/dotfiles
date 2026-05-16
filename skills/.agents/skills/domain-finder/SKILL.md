---
name: domain-finder
description: Find available domains for a project using the tldx CLI. Use this skill whenever the user mentions finding a domain, brainstorming domain names, checking domain availability, naming a project or startup, or asks "what domain should I use" — even if they don't say "tldx" or "domain search" explicitly.
license: MIT
allowed-tools: Bash
---

# Domain Finder

Find available, memorable domain names for a project by running `tldx` with sensible defaults.

## When to use this skill

Any time the user wants to:
- Find a domain for a project, app, or startup
- Check if a domain name is available
- Brainstorm domain names from a description or idea
- See what's available for a given word or phrase

## Workflow

### 1. Extract keywords

From the user's project name or description, pick **1–3 short, memorable keywords**:
- Strip filler words: a, the, for, that, with, and, or, to, of, in, is
- Prefer concrete nouns or verbs over adjectives
- Keep each keyword under ~8 characters — shorter keywords produce shorter, more memorable domains
- If the description is already 1–2 short words, use them directly
- Prefer single-word roots over phrases unless the user explicitly wants multi-word names

**Examples:**
- "a task manager for teams" → `task`
- "invoice and billing tool" → `invoice bill`
- "AI writing assistant" → `write scribe`
- "recipe sharing app" → `recipe`
- "fast link shortener" → `link`

### 2. Run tldx

Default to single-word domains with short TLDs. Avoid prefixes unless the user explicitly requests them.

Preferred TLDs when the user doesn't specify: `.com`, `.co`, `.io`, `.dev`, `.sh`, `.so`, `.net`.
Deprioritize `.ly` unless the user explicitly asks for it or confirms pricing is acceptable.

Use this as the default command:

```bash
tldx <keywords> \
  -t com,co,io,dev,sh,so,net \
  --only-available \
  --show-stats \
  --no-color \
  -m 20
```

The `-m 20` cap keeps domains short and usable — anything longer tends to be hard to say or remember.

If the user wants prefixes/suffixes, add them explicitly and keep them minimal (e.g., `-p get,use` or `-s hub,app`).

If the user has a preference (e.g., they only want `.com`, or they want cheaper TLDs), adjust the command:
- Specific TLDs: replace `--tld-preset startup` with `-t com,io,ai`
- Budget options: `--tld-preset cheap`
- Tech-focused: `--tld-preset tech`

Special rule for `.ly`: only keep `.ly` results that read as natural adverbs (e.g., `persistent.ly`, `curious.ly`).
If the word is not a plausible adverb, exclude it or prefer another TLD. Also avoid base roots ending in `ly` (e.g., `markly.ly`), so the output stays in the form `word.ly` rather than `wordly.ly`.

### 3. Present results

After running, highlight the best picks before showing the full list. Prioritize:
1. Single-word domains on `.com`
2. Single-word domains on `.co` or `.io`
3. Short `.sh`, `.so`, `.net` options
4. Adverb-valid `.ly` domains only when the user requested `.ly`

### 2b. Bulk keyword strategy (when asked)

If the user asks for a larger sweep, generate 100–200 short roots and pass them via file input:

```bash
tldx -i /tmp/domain_words.txt \
  -t com,co,io,dev,sh,so,net \
  --only-available \
  --show-stats \
  --no-color \
  -m 20
```

Use a file-based list when the user explicitly asks for a bigger sweep or says “keep searching.”

### 2c. Best-practice filters

- Prefer short, pronounceable, single-word roots
- Avoid hyphens, numbers, and awkward spellings
- Favor easy-to-spell, easy-to-say names
- Check for obvious trademark conflicts and handle availability separately

Format your response like this:

```
## Top picks
- `keyword.com` — short, clean, easy to say
- `keyword.io` — strong tech vibe
- `adverb.ly` — only if the adverb reads naturally

## Other available options
[list the rest, grouped loosely by TLD]

## Stats
X domains checked, Y available
```

If **nothing is available**, say so clearly and offer to:
- Try different or shorter keywords
- Try a different preset (`--tld-preset popular` or `--tld-preset cheap`)
- Drop prefixes/suffixes for a cleaner search

## Notes

- tldx is installed at `/usr/bin/tldx`
- Results stream in real time; stats appear at the end
- RDAP/WHOIS checks can occasionally time out for obscure TLDs — that's normal
- Don't overwhelm the user with 50+ results; curate and lead with the best 5–10
