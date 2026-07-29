# AGENTS.md

Guide for AI agents working in this repository. Read this before editing anything.

## What this project is

A **frequentist network meta-analysis (NMA)** comparing three second-line CD19-directed CAR T-cell therapies (**axi-cel, tisa-cel, liso-cel**) against standard-of-care salvage chemoimmunotherapy in relapsed/refractory large B-cell lymphoma (R/R LBCL).

The evidence base is exactly **three phase III RCTs**: ZUMA-7, TRANSFORM, and BELINDA — each a CAR-T vs. a shared standard-of-care comparator. There is **no head-to-head CAR-T vs. CAR-T trial**.

## Repository state and conventions

This is an **RStudio R project** (`.Rproj` file at repo root) that is currently in the **protocol/design stage**. There is **no R source code yet** — only documentation. When code is added, keep it consistent with the RStudio project settings:

- **Editor**: spaces for tabs, **2 spaces** per tab; UTF-8 encoding (see `network-meta-analysis-project-CART.Rproj`).
- `.gitignore` is the standard R/RStudio template (ignores `.Rhistory`, `.RData`, `.Rproj.user/`, knitr caches, etc.). Do not commit workspace/session artifacts.
- Licensed under **MIT** (Copyright Zoubayda Baoubbou).

### Layout

```
.
├── README.md                                   # One-line project title
├── LICENSE                                      # MIT
├── network-meta-analysis-project-CART.Rproj    # RStudio project
├── .gitignore                                  # R/RStudio template
└── Docs/
    ├── protocol.md                              # Full analysis protocol (source of truth)
    └── references.bib                           # BibTeX bibliography
```

`Docs/protocol.md` is the **canonical specification** for the analysis. If anything in code contradicts the protocol, the protocol wins unless explicitly stated otherwise.

### Documentation conventions

- Prose is written in **Markdown** with **Pandoc-style citations** (`@bishop2022`, `[@locke2022; @abramson2023]`) that resolve against `Docs/references.bib`. When adding references, add the BibTeX entry to `references.bib` and use the `@key` form in the text.
- BibTeX keys are **lowercase author surname + year** (e.g. `bishop2022`, `locke2022`, `acs2025`).

## Intended statistical tooling (from the protocol)

Code should be written in **R**, using:

- **`netmeta`** package — frequentist NMA. The binary outcomes (CR primary; ORR secondary) are modelled on the **log odds ratio** scale.
- **`pairwise()`** from `netmeta` — used only to **reshape arm-level data** into the contrast-based long format the network model consumes. It is *not* a pooling step here, because each direct comparison is informed by exactly one trial.
- **`robvis`** package — Cochrane RoB2 visualization (traffic-light + summary plots).

If an agent adds dependencies, these are the established ones; reuse them rather than introducing alternatives unless the protocol is updated.

## Critical methodological constraints (non-obvious — read before coding)

These are structural facts about this evidence base. They shape every analysis decision and should **not** be "fixed" by an agent without updating the protocol.

1. **Star-shaped network, no closed loops.** All three CAR-T therapies connect only through the shared standard-of-care arm. Consequences:
   - **Consistency is NOT assessable.** Do not run node-splitting — there is no direct-vs-indirect evidence to compare.
   - **Between-study heterogeneity is NOT formally estimable** (τ², I² require multiple trials per comparison). Report this as a structural limitation, **never** as "heterogeneity = 0".
2. **Common-effect (fixed-effect) model is the primary analysis by design.** A random-effects model cannot be justified because heterogeneity is inestimable in a three-trial, one-trial-per-edge network. Do not switch to random-effects as a "default".
3. **Reference treatment is standard of care.** Set it explicitly in `netmeta()`.
4. **Ranking uses P-scores** (netmeta's frequentist analogue to SUCRA). Interpret alongside point estimates and CIs, not in isolation — uncertainty is wide in a three-trial network.

## Data handling rules

- **Time-to-event outcomes** (EFS primary; OS, PFS secondary): use hazard ratios from the **longest available follow-up** per study.
- **Dichotomous outcomes** (ORR, CRR; safety): extract **N randomized and N responders per arm** as raw counts from each primary publication's results tables or supplementary appendices.
- **TRANSFORM has two readouts** (interim + primary/updated). The **primary analysis is the base case**; the interim readout is a secondary check. Always state explicitly which readout a number comes from.
- **Back-calculated values are flagged.** Any count derived by back-calculation from a reported percentage (rather than read as a raw count) must be marked in the data dictionary. Do not silently mix raw and derived counts.

## Outcomes reference

- **Primary**: Event-free survival (EFS).
- **Secondary**: Overall survival (OS), Progression-free survival (PFS), Overall response rate (ORR), Complete response rate (CRR), Duration of response (DOR), Treatment-emergent adverse events (TEAEs), Serious adverse events (SAEs), Grade ≥3 adverse events (CTCAE).
- **Sensitivity/secondary NMA**: re-estimate the network using **ORR in place of CR** to confirm ranking and direction of effect are robust to the response definition.

## Risk of bias and certainty

- **RoB2** (Cochrane) across five domains, **assessed by a single reviewer** — a stated methodological limitation of this project. Visualized with `robvis`.
- **CINeMA framework** applied **qualitatively** across five domains (within-study bias, indirectness, imprecision, heterogeneity, incoherence), each rated High/Moderate/Low/Very low with a brief justification. Do **not** invoke the formal CINeMA web application — the protocol deliberately uses the qualitative approach.

## External validity check

Results are compared **qualitatively** (direction and rough magnitude) against published **matching-adjusted indirect comparisons (MAICs)** of the same three products. This is an external plausibility check, not a pre-specified statistical method.

## Working on this repo

- **Do not invent commands.** There is no build/test/lint pipeline yet because there is no code. When R scripts are added, prefer running them via the RStudio project (`Open Project` on the `.Rproj`) or with `Rscript` from the repo root so the project's working directory and encoding are respected.
- Before writing analysis code, re-read `Docs/protocol.md` end to end — it defines the eligibility criteria, PICO, outcomes, and every analytical choice. Code that diverges from the protocol should also update the protocol.
