---
name: study-memory-tex
description: Convert school exam papers, wrong-answer collections, homework, notes, screenshots, PDFs, DOCX files, and pasted questions into short, human-memorable K-12 knowledge points or reusable solution methods, independently verify the conclusions, and generate a compilable Chinese TeX revision document. Use this skill whenever the user asks to summarize exam questions, organize mistakes, extract test points, make revision cards, condense exercises into a concise study handout, or produce a TeX/PDF memory guide from educational materials, even if they only mention a photo, scan, or attachment of a paper.
compatibility: Requires access to supplied attachments and the latex-document-skill for TeX generation and compilation.
---

# Study Memory TeX

Turn learning materials into a compact revision document that helps a learner remember and reuse the underlying knowledge. The goal is not to rewrite the paper or produce a long solution manual. Each item should be short enough to review repeatedly, yet complete enough to understand without the original paper.

## Scope and outcome

Accept one or more of: images, scanned or digital PDFs, DOCX files, pasted text, answer keys, student work, annotations, and mixed attachments. Support K-12 subjects. Produce a Chinese `.tex` file and compile it via `latex-document-skill` when the environment permits.

The document must distinguish verified results from uncertain ones. Never turn an incomplete image, ambiguous question, or disputed answer into a confident rule — a wrong "memory card" is worse than no card, because the learner will trust and repeat it.

## Workflow

### 1. Inspect and normalize the source

1. Inventory every supplied file and classify it as question paper, wrong-answer record, answer key, notes, or student work.
2. Extract visible text, equations, diagrams, options, conditions, the given answer, and the student answer where present. Preserve page and question references.
3. For scans or screenshots, record regions that are too blurry, cropped, or ambiguous to rely on. Do not invent missing symbols, diagram labels, units, or answer choices.
4. Group related fragments before analysis — a question may span pages, or its diagram and conditions may be separated.
5. Identify subject, grade band if evident, topic, and question type. If classification is uncertain, mark it as tentative rather than forcing a category.

### 2. Solve and verify before extracting memory points

Verify by independent reconstruction, not by trusting the provided solution. The verification target is the conclusion and the reusable method, not stylistic wording.

**Objective STEM questions** (mathematics, physics, chemistry, biology, computing):

1. Restate the known conditions and the requested result.
2. Solve independently, making all material assumptions visible.
3. Check units, signs, domains, boundary conditions, and whether each step is reversible when relevant.
4. Compare with any supplied answer or student work; explain material discrepancies briefly.
5. Mark `已复核` only when both the result and the reusable method follow from a sufficiently complete prompt.

**Language and humanities questions** (Chinese, English, history, geography, civics):

1. Separate objective facts, grammar/rule claims, and interpretation-dependent claims.
2. Verify factual and rule-based claims from the prompt and internally consistent reasoning; consult authoritative reference material only when available and helpful.
3. For reading comprehension and open responses, extract evidence-backed answer patterns rather than asserting one uniquely correct interpretation, unless the rubric establishes one.
4. Mark interpretation-dependent conclusions as `部分复核` and state what depends on the rubric or context.

**Confidence labels**

- `已复核` — prompt is adequate and the conclusion/method was independently checked.
- `部分复核` — main idea is plausible but depends on an unavailable rubric, an external source, or interpretation.
- `待人工确认` — source is incomplete, unreadable, internally inconsistent, or insufficient for reliable verification.

### 3. Extract only what is worth memorizing

Create a memory card only when it yields a transferable point. Do not create one card per question by default; merge duplicates and organize cards by subject, then topic.

Do not impose a fixed field template. The reader is an adult learner, not a form to fill in — a card is good when it states the point clearly, in natural prose or a couple of short lines. What matters is that each card, in whatever form fits, makes clear:

- what the rule or method actually is, precisely enough to apply;
- when it applies (only if this is not obvious from the statement itself);
- the specific trap the source material revealed, when there is one worth remembering;
- where it came from (page/question) and its confidence label, kept unobtrusive (e.g., a small note at the card's corner or end).

Skip anything that would be padding for a given card — no forced "自测提示" or "操作步骤" when the point is a one-line fact. Conversely, a genuinely procedural method may deserve numbered steps. Let the content decide the shape.

Compression rules:

- Prefer a discriminating condition over generic advice. “分母可能为零时先写定义域” beats “仔细检查”.
- Include formulas only together with variable meanings and application conditions.
- Retain a minimal original-context anchor when it prevents the card from becoming cryptic.
- Keep a card normally within 60–140 Chinese characters excluding formulas; extend only when omitting a condition would mislead.
- Distinguish a theorem/rule from a solution trick; do not present a shortcut as universally valid.
- Do not include student names, school identifiers, or other unnecessary personal information.

### 4. Write the TeX document

Invoke `latex-document-skill` for TeX creation and compilation. Use its cheat-sheet / reference-card workflow as the baseline, but prioritize readability over maximum density. Generate a Chinese, XeLaTeX-compatible document.

Document structure:

1. Title: `错题记忆卡` or a source-appropriate title.
2. Brief preface: source scope, card count, confidence-label legend.
3. One section per subject; topic subsections only when needed.
4. A visually distinct card block (e.g., `tcolorbox`) per knowledge point.
5. A final `待确认项目` section whenever any source or conclusion could not be verified.

TeX quality requirements:

- Use XeLaTeX with Chinese font support (`ctex` or `xeCJK`).
- Escape LaTeX special characters; put mathematical relations in math mode.
- Render fractions, exponents, chemical formulae, vectors, units, and subscripts correctly.
- Use real source references like `第 2 页，第 5 题`; never fabricate page or question numbers.
- Do not reproduce long copyrighted problem statements — use compact paraphrases or source pointers.
- Compile the `.tex`, inspect errors, and fix them before delivering. If compilation is unavailable, still deliver valid `.tex` and state that it was not compiled.

## Final response

Report the output paths, the number of cards, and counts by confidence label. Call out unresolved items in plain language. Do not claim every point is correct when any part remains unverified.

## Example card content

Two cards, showing that shape follows content — a procedural method gets steps, a one-line fact stays one line:

```text
二次函数区间最值
求 y=ax^2+bx+c 在闭区间上的最值时，候选点只有顶点（若在区间内）和两个端点，
三个都算出来再比较。只算顶点或只看一个端点都会漏解。
—— 第 1 页第 3 题 · 已复核

让步结构里真实信息在主句
"Although A, B" 中 A 是背景或意图，B 才是作者/说话人认定的事实。
intended to ≠ 已实现。
—— 阅读题 2 · 已复核
```
