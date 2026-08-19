# Data Dictionary — CAR-T NMA in 2L+ LBCL

**Project:** network-meta-analysis-project-CART
**Extractor:** Zoubayda Baoubbou
**Date template created:** 2026-08-19
**Protocol version:** 1.0
**Dictionary version:** 1.1

---

## 1. Source Publications

| Trial | NCT ID | Citation | Year | Phase | PDF Location |
|-------|--------|----------|------|-------|--------------|
| ZUMA-7 | NCT03391466 | Locke FL et al., NEJM | 2022 | 3 | `pdfs/zuma7_locke_2022.pdf` |
| TRANSFORM | NCT03575351 | Abramson JS et al., NEJM | 2022 | 3 | `pdfs/transform_abramson_2022.pdf` |
| BELINDA | NCT03570892 | Sehn LH et al., NEJM | 2022 | 3 | `pdfs/belinda_sehn_2022.pdf` |

> PDFs are stored locally in `pdfs/` and gitignored. Do not commit copyrighted material.
> NCT IDs and phase verified against ClinicalTrials.gov (2026-08-19): ZUMA-7 (Kite), TRANSFORM (Celgene; JCAR017/liso-cel), BELINDA (Novartis).

---

## 2. Extraction Rules (Pre-specified)

| Rule | Specification |
|------|---------------|
| **Primary analysis set** | ITT (randomized set) for efficacy; safety set for toxicity |
| **HR computation** | `seTE <- (log(hr_ci_hi) - log(hr_lo)) / (2 * qnorm(0.975))` |
| **Binary effect measure** | Odds ratio (OR) |
| **Outcome labels** | `CRR` (not CR), `ORR`, `EFS`, `OS`, `PFS` — matching protocol wording |
| **PROs** | Descriptive summary only — no NMA pooling |

---

## 3. Cell-Level Traceability

### 3.1 nma_time2event.csv

| trial_id | outcome | analysis_type | hr | hr_ci_lo | hr_ci_hi | population | efs_event_definition | source_pub | table_figure | page | notes |
|----------|---------|---------------|-----|----------|----------|------------|----------------------|------------|--------------|------|-------|
| zuma7 | EFS | ITT | | | | ITT | | Locke et al. 2022 | | | |
| zuma7 | OS | ITT | | | | ITT | n/a | Locke et al. 2022 | | | |
| zuma7 | OS | crossover-adjusted | | | | ITT | n/a | Locke et al. 2022 | | | only if reported (e.g., RPSFT); else leave blank + note |
| zuma7 | PFS | ITT | | | | ITT | n/a | Locke et al. 2022 | | | |
| transform | EFS | ITT | | | | ITT | | Abramson et al. 2022 | | | |
| transform | OS | ITT | | | | ITT | n/a | Abramson et al. 2022 | | | |
| transform | OS | crossover-adjusted | | | | ITT | n/a | Abramson et al. 2022 | | | 50/92 (54%) SOC→liso-cel crossover; adjusted HR if reported |
| transform | PFS | ITT | | | | ITT | n/a | Abramson et al. 2022 | | | |
| belinda | EFS | ITT | | | | ITT | | Sehn et al. 2022 | | | |
| belinda | OS | ITT | | | | ITT | n/a | Sehn et al. 2022 | | | |
| belinda | OS | crossover-adjusted | | | | ITT | n/a | Sehn et al. 2022 | | | only if reported; else leave blank + note |
| belinda | PFS | ITT | | | | ITT | n/a | Sehn et al. 2022 | | | |

> `efs_event_definition`: record each trial's verbatim event definition from the methods/protocol section. This documents the outcome-level transitivity threat (ZUMA-7 vs BELINDA definitions differ materially) at extraction time rather than reconstructing it at writing time.

### 3.2 nma_binary.csv

| trial_id | outcome | events_int | n_int | events_ctrl | n_ctrl | analysis_set | source_pub | table_figure | page |
|----------|---------|------------|-------|-------------|--------|--------------|------------|--------------|------|
| zuma7 | CRR | | | | | randomized | Locke et al. 2022 | | |
| zuma7 | ORR | | | | | randomized | Locke et al. 2022 | | |
| transform | CRR | | | | | randomized | Abramson et al. 2022 | | |
| transform | ORR | | | | | randomized | Abramson et al. 2022 | | |
| belinda | CRR | | | | | randomized | Sehn et al. 2022 | | |
| belinda | ORR | | | | | randomized | Sehn et al. 2022 | | |
| zuma7 | TEAE | | | | | safety | Locke et al. 2022 | | |
| zuma7 | SAE | | | | | safety | Locke et al. 2022 | | |
| zuma7 | grade3plus_AE | | | | | safety | Locke et al. 2022 | | |
| transform | TEAE | | | | | safety | Abramson et al. 2022 | | |
| transform | SAE | | | | | safety | Abramson et al. 2022 | | |
| transform | grade3plus_AE | | | | | safety | Abramson et al. 2022 | | |
| belinda | TEAE | | | | | safety | Sehn et al. 2022 | | |
| belinda | SAE | | | | | safety | Sehn et al. 2022 | | |
| belinda | grade3plus_AE | | | | | safety | Sehn et al. 2022 | | |

> Safety league table is descriptive only, per protocol — no "safest CAR-T" ranking. CRS/ICANS-specific rows may be added for narrative description but will not enter the NMA.

### 3.3 characteristics.csv

| trial_id | intervention | control | phase | line_of_therapy | n_randomized | median_age | male_pct | ipi_high_pct | primary_refractory_pct | early_relapse_pct | region_mix | time_dx_to_infusion | prior_lines | bridging_allowed | crossover_pct | source_pub | table_figure | page |
|----------|--------------|---------|-------|-----------------|--------------|------------|----------|--------------|------------------------|-------------------|-------------|--------------------|-------------|-----------------|---------------|------------|--------------|------|
| zuma7 | axi-cel | SOC | 3 | 2L+ | | | | | | | | | | no | | Locke et al. 2022 | | |
| transform | liso-cel | SOC | 3 | 2L+ | | | | | | | | | | yes | | Abramson et al. 2022 | | |
| belinda | tisa-cel | SOC | 3 | 2L+ | | | | | | | | | | yes | | Sehn et al. 2022 | | |

> Columns beyond `male_pct` exist to support the protocol's transitivity assessment (IPI distribution, primary refractory vs early relapse mix, geographic region, time from diagnosis to infusion, bridging policy, crossover). `bridging_allowed` pre-filled from trial design (ZUMA-7: not permitted; TRANSFORM: permitted); verify against methods section during extraction.

### 3.4 pros.csv

| trial_id | instrument | domain | timepoint | source_pub | table_figure | page |
|----------|------------|--------|-----------|------------|--------------|------|
| zuma7 | EORTC QLQ-C30 | Global health status | Baseline | Locke et al. 2022 | | |
| zuma7 | EORTC QLQ-C30 | Global health status | Month 6 | Locke et al. 2022 | | |

> Rows for TRANSFORM (EQ-5D) and BELINDA to be added at extraction if reported. PROs are descriptive only; no pooling.

---

## 4. Reconstructed Data Flags

| trial_id | outcome | method | software | flag_in_dictionary | sensitivity_analysis |
|----------|---------|--------|----------|--------------------|--------------------|
| | | Tierney et al. (2007) / Parmar et al. (1998) | metaDigitise | YES | planned |

> Fill one row per reconstructed cell. Reconstructed cells are used in sensitivity analysis only; primary analysis uses reported estimates wherever available.

---

## 5. Discrepancy Log (Step 17 — Blinded Verification)

**Procedure:** Pass 1 extraction → wait ≥7 days → Pass 2 blinded re-extraction → diff in R → resolve.

| trial_id | outcome | variable | pass1_value | pass2_value | discrepancy_type | resolution | date |
|----------|---------|----------|-------------|-------------|-----------------|------------|------|
| | | | | | | | |

> **Discrepancy types:** transcription_error, interpretation_error, unit_error, rounding_error

---

## 6. Change Log

| Date | Change | Version |
|------|--------|---------|
| 2026-08-19 | Initial template | 1.0 |
| 2026-08-19 | v1.1: corrected TRANSFORM phase to 3; added EFS rows and per-trial EFS event-definition column; completed ORR and safety-outcome rows for all trials; renamed CR→CRR; added transitivity columns to characteristics.csv; added crossover-adjusted OS analysis_type rows; added outcome-label rule | 1.1 |
