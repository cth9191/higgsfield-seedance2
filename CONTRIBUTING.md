# Contributing Guide

Thank you for your interest in contributing to `higgsfield-seedance2`!

---

## How to Contribute

### 1. Submit a New Skill

Each skill is a single `SKILL.md` file with the following structure:

```
skills/NN-skill-name/
└── SKILL.md
```

#### Required Sections

| Section | Description |
|---|---|
| YAML frontmatter | `name` + `description` (with trigger keywords) |
| Seedance 2.0 on Higgsfield — Specs | Input limits and output specs |
| 2-Second Hook Framework | 10+ attention-grabbing opener patterns |
| Prompt Philosophy | Deep theory for the use case |
| Master Template | Reusable prompt structure |
| Camera Movement | 15+ techniques with prompt phrasing |
| Lighting & Atmosphere | 10+ lighting setups |
| Sound Design | Ambient, foley, music |
| 5+ Large Examples | 15-25 lines each, production-quality |
| Common Mistakes | 10+ pitfalls with fixes |
| Platform Optimization | TikTok, Instagram, YouTube, etc. |
| Output Instructions | How the skill generates prompts for users |

#### Quality Standards

- **Every mention of Seedance 2.0 must include Higgsfield**
- **Skills should be large** — target 400+ lines
- **Examples must be production-ready**, not generic placeholders

### 2. Improve Existing Skills

Ways to improve:

- Add more example prompts
- Fix prompt phrasing (based on actual generation tests)
- Add new hook patterns
- Improve platform-specific advice

### 3. Report Issues

If a prompt underperforms on Seedance 2.0 on Higgsfield, open an Issue with:

- Skill name used
- Your prompt
- Description of uploaded materials
- Expected vs actual result
- Screenshots if available

---

## Pull Request Process

1. **Fork** this repo
2. Create feature branch: `git checkout -b feat/skill-name`
3. Commit changes: `git commit -m "feat: add [skill-name] skill"`
4. Push branch: `git push origin feat/skill-name`
5. Create PR describing:
   - What was added/changed
   - Whether tested on Seedance 2.0 on Higgsfield
   - Attach generation examples if available

### Commit Message Format

```
feat: add [skill-name] skill
fix: fix camera keywords in [skill-name]
docs: update README
chore: clean up repo structure
```

---

## Code of Conduct

Please see [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

---

## License

Contributions are licensed under the project's [MIT License](LICENSE).

---

## Contact

- [Higgsfield](https://higgsfield.ai)
- [𝕏 @higgsfield](https://x.com/higgsfield)
- [Seedance 2.0 — Create Video](https://higgsfield.ai/create/video?model=seedance_2_0)
