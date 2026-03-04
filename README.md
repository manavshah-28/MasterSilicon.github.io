# ModernSilicon — Hardware Design Interview Prep

A static, no-backend interview prep site for chip engineers.  
Add questions by adding files. No HTML editing required.

## Directory Structure

```
modernsilicon/
├── index.html                        ← The entire site (never edit this)
├── questions/
│   ├── manifest.json                 ← ✏️ ONLY file to edit when adding questions
│   ├── _TEMPLATE/                    ← Copy this to create a new question
│   │   ├── info.txt
│   │   ├── description.txt
│   │   ├── solution.sv
│   │   └── testbench.sv
│   ├── RTL/
│   │   ├── 001-dff-sync-reset/
│   │   │   ├── info.txt
│   │   │   ├── description.txt
│   │   │   ├── solution.sv
│   │   │   └── testbench.sv
│   │   └── 002-fsm-sequence-detector/
│   ├── DFT/
│   ├── DV/
│   ├── CDC/
│   ├── ARCH/
│   └── STA/
```

## How to Add a Question

### 1. Create the folder

```bash
cp -r questions/_TEMPLATE questions/RTL/003-my-new-topic
```

Name format: `NNN-short-kebab-description`

### 2. Fill in the four files

**info.txt** — metadata:
```
title: Your Question Title Here
difficulty: Easy          # Easy | Medium | Hard
tags: always_ff, FSM, sequential
related: RTL-001, DFT-001
```

**description.txt** — concept explanation:
```
## Main Concept Heading

Write your explanation here. Supports:

- Bullet points
- `inline code` with backticks
- **bold text**
- ## Headings and ### Sub-headings

> TIP: Use "> TIP:" for a teal callout box.
> WARNING: Use "> WARNING:" for an amber callout.

Fenced code blocks:
```
module example (...);
```
```

**solution.sv** — reference implementation (shown with syntax highlighting)

**testbench.sv** — simulation testbench

### 3. Register in manifest.json

Open `questions/manifest.json` and add one entry to the `questions` array:

```json
{
  "id": "RTL-003",
  "category": "RTL",
  "folder": "RTL/003-my-new-topic"
}
```

**ID format:** `CATEGORY-NNN` (e.g., `RTL-003`, `DFT-007`, `ARCH-002`)

### 4. Push and deploy

```bash
git add .
git commit -m "Add RTL-003: My New Topic"
git push
```

The site updates automatically. No HTML edits needed.

---

## Deploying

### GitHub Pages (recommended)
1. Push this folder to a GitHub repository
2. Go to Settings → Pages → Source: Deploy from branch → `main` → `/root`
3. Your site is live at `https://username.github.io/repo-name/`

### Netlify / Vercel
Drag and drop the folder, or connect your GitHub repo. Set publish directory to `/`.

### Local Development
```bash
# Python 3
python3 -m http.server 8080

# Node.js
npx serve .
```

> **Important:** The site must be served over HTTP — it uses `fetch()` to load question files. Opening `index.html` directly as a local file (file://) will not work due to browser CORS restrictions.

---

## Running Questions Locally

```bash
cd questions/RTL/001-dff-sync-reset
iverilog -g2012 -Wall -o sim.out solution.sv testbench.sv
vvp sim.out
gtkwave sim.vcd
```

## Question IDs

| Category | Prefix | Example |
|----------|--------|---------|
| RTL Design | RTL | RTL-001 |
| DFT | DFT | DFT-001 |
| Verification | DV | DV-001 |
| CDC | CDC | CDC-001 |
| Comp Arch | ARCH | ARCH-001 |
| Timing/STA | STA | STA-001 |

Keep IDs sequential within each category. The site displays them in manifest order.
