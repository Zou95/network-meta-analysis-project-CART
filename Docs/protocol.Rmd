# Protocol

## Title:
Comparative Efficacy and Safety of Second-Line CD19-Directed CAR T-Cell Therapies for Relapsed or Refractory Large B-Cell Lymphoma: A Frequentist Network Meta-analysis Protocol

## Project Aim:
The aim of this project is to conduct a reproducible frequentist network meta-analysis in R comparing second-line CAR-T therapies for relapsed or refractory large B-cell lymphoma. Statistical analyses will be conducted in R using a fully reproducible workflow.

## Background
Aggressive non-Hodgkin lymphoma (NHL) comprises a heterogeneous group of lymphoid malignancies and represents one of the most common hematological cancers worldwide. Approximately 250,000 new cases are diagnosed each year globally, with large B-cell lymphoma (LBCL) accounting for around one-third of adult NHL cases and occurring predominantly in older adults who frequently depict multiple comorbidities [@bishop2022; @ernst2021]. In the United States, an estimated 80,350 new cases of NHL are expected in 2025, including 45,140 cases in men and 35,210 cases in women [@acs2025].

Diffuse large B-cell lymphoma (DLBCL) is the most common subtype of LBCL, accounting for approximately 80–90% of cases [@bishop2022]. Although first-line treatment with rituximab plus cyclophosphamide, doxorubicin, vincristine, and prednisone (R-CHOP) achieves durable remissions for many patients, outcomes remain poor for those with primary refractory disease or relapse within 12 months of initial therapy [@bishop2022]. Historically, the standard second-line treatment for eligible patients has consisted of platinum-based salvage immunochemotherapy followed by high-dose chemotherapy and autologous stem-cell transplantation (ASCT) in patients achieving an adequate response. However, more than half of patients fail to proceed to ASCT because salvage therapy does not sufficiently reduce tumour burden, highlighting a substantial unmet clinical need [@bishop2022].

Recent advances in immunotherapy have transformed the treatment landscape for relapsed or refractory (R/R) LBCL. Novel therapeutic approaches, including monoclonal antibodies, antibody–drug conjugates (ADCs), bispecific antibodies (BsAbs), and CD19-directed chimeric antigen receptor (CAR) T-cell therapies, have expanded treatment options for patients with advanced disease [@abrisqueta2024]. Axicabtagene ciloleucel (axi-cel), tisagenlecleucel (tisa-cel), and lisocabtagene maraleucel (liso-cel) were initially approved for third-line or later treatment of R/R LBCL following the results of the single-arm ZUMA-1, JULIET, and TRANSCEND NHL 001 studies, respectively [@neelapu2017; @schuster2019; @abramson2020].

Subsequently, three phase III randomized controlled trials—ZUMA-7, TRANSFORM, and BELINDA—evaluated whether CAR T-cell therapy could improve outcomes when used earlier in the treatment pathway as second-line therapy for patients with primary refractory or early relapsed LBCL. Both ZUMA-7 and TRANSFORM demonstrated superior outcomes compared with standard salvage chemotherapy followed by ASCT, leading to second-line approval of axi-cel and liso-cel [@locke2022; @abramson2023]. In contrast, BELINDA did not demonstrate a significant improvement over standard of care, and consequently tisa-cel did not receive regulatory approval for second-line treatment and remains indicated in later lines of therapy [@bishop2022]. Nevertheless, BELINDA enrolled the same second-line patient population and evaluated the same treatment strategy as the other phase III trials, making it an appropriate study for inclusion in comparative evidence synthesis.

To date, no randomized head-to-head trial has directly compared axi-cel, liso-cel, and tisa-cel. Instead, each CAR T-cell therapy has been evaluated only against a common standard-of-care comparator. Consequently, indirect treatment comparisons (ITCs) are required to estimate the relative efficacy of these interventions. Network meta-analysis (NMA), a robust form of indirect treatment comparison, enables simultaneous comparison of multiple interventions while preserving the randomization within each included trial and provides estimates of comparative treatment effects when direct evidence is unavailable.

Therefore, the objective of this project is to conduct a frequentist network meta-analysis to indirectly compare the efficacy of CD19-directed CAR T-cell therapies evaluated in randomized second-line trials in patients with relapsed or refractory LBCL.


## Research Question
In adults with primary refractory or early relapsed (≤12 months after completion of first-line therapy) large B-cell lymphoma eligible for second-line treatment, how do axicabtagene ciloleucel, tisagenlecleucel, and lisocabtagene maraleucel compare with one another and with standard-of-care salvage chemoimmunotherapy?

## PICO
### Population
Adult patients (≥18 years) with primary refractory or early relapsed (≤12 months after completion of first-line chemoimmunotherapy) large B-cell lymphoma eligible for second-line treatment.
### Intervention
Three CD19-directed CAR T-cell therapies administered as second-line treatment: axicabtagene ciloleucel, lisocabtagene maraleucel, and tisagenlecleucel.
### Comparator
Standard-of-care platinum-based salvage chemoimmunotherapy followed, where appropriate, by high-dose chemotherapy and autologous stem-cell transplantation (ASCT).
### Outcomes
#### Primary Outcomes
- Event-free survival (EFS)
#### Secondary Outcomes
- Overall survival (OS).
- Progression-free survival (PFS).
- Overall response rate (ORR).
- Complete response rate (CRR).
- Duration of response (DOR).
- Treatment-emergent adverse events (TEAEs).
- Serious adverse events (SAEs).
- Grade ≥3 adverse events (CTCAE).
### Timing (if applicable)
Outcomes will be extracted at the longest available follow-up reported for each included study. For time-to-event outcomes (EFS, OS, PFS), hazard ratios from the longest available follow-up will be used. For dichotomous outcomes (ORR, CRR, DOR, and safety outcomes), the final reported assessment for each study will be extracted.

## Eligibility Criteria
### Inclusion Criteria
- Phase III randomized controlled trials (RCTs).
- Adults (≥18 years) with primary refractory or early relapsed (≤12 months after completion of first-line therapy) large B-cell lymphoma (LBCL) who are eligible for second-line treatment.
- Treatment with one of the following CD19-directed CAR-T cell therapies: Axicabtagene ciloleucel, Tisagenlecleucel, Lisocabtagene maraleucel
- Standard-of-care salvage chemoimmunotherapy, or another eligible intervention within the treatment network.
- Studies reporting at least one of the predefined outcomes
- Full-text articles published in peer-reviewed journals

### Exclusion Criteria
- Non-randomized studies
- Single-arm studies
- Phase I or Phase II clinical trials
- Studies including pediatric populations (<18 years).
- Studies evaluating patients receiving third-line or later therapy
- Studies involving lymphoma subtypes outside the predefined LBCL population.
- Reviews, editorials, letters, case reports, case series, conference abstracts without sufficient data, and study protocols.
- Duplicate publications (the publication with the most complete or most recent data will be included)

## Search Strategy
### Databases
PubMed/MEDLINE; ClinicalTrials.gov, for trial-registration cross-checks; Cochrane CENTRAL where accessible
### Search Terms
The search will include terms for:
Population: "large B-cell lymphoma", "large B cell lymphoma", "diffuse large B-cell lymphoma", "DLBCL", "LBCL".
Intervention: "CAR-T", "CAR T", "CAR-T cell", "CAR T-cell", "chimeric antigen receptor", "chimeric antigen receptor T cell", "axicabtagene ciloleucel", "axi-cel", "tisagenlecleucel", "tisa-cel", "lisocabtagene maraleucel", and "liso-cel".
Study design: "randomized", "randomised", "randomized controlled trial", "phase III", "phase 3", and "clinical trial".
Boolean operators (AND/OR) will be used to combine search terms, and database-specific syntax will be applied as appropriate. Reference lists of included studies and relevant reviews will also be screened to identify additional eligible studies.
### Study Selection Process
Records identified through the database searches will be imported into a reference management software, and duplicate records will be removed. Titles and abstracts will be screened against the predefined eligibility criteria, followed by full-text assessment of potentially eligible studies. Study selection will be conducted by a single reviewer due to the scope and resource constraints of this project. This approach differs from the standard practice of independent screening by two reviewers and is acknowledged as a methodological limitation. Reasons for exclusion at full-text review will be documented and summarized in a PRISMA 2020 flow diagram.

## Data Extraction
### Variables to Extract
Trial identifiers (NCT number, citation, year, journal); design features (randomization ratio, blinding status, sample size per arm, bridging-therapy policy, crossover provisions); population characteristics relevant to transitivity (age, prior lines of therapy, disease stage); and outcome data by arm.
### Outcomes
N randomized and N responders for CR and ORR, extracted per arm directly from each primary publication's results tables or supplementary appendices. Where a trial has more than one published analysis (TRANSFORM has an interim and a primary/updated readout), the readout used as the base case is stated explicitly. Any value back-calculated from a reported percentage rather than read as a raw count is flagged in the accompanying data dictionary.
## Risk of Bias Assessment
Cochrane RoB2, assessed per trial across its five domains — randomization process; deviations from intended interventions; missing outcome data; measurement of the outcome; selection of the reported result — by a single reviewer. Judgments are visualized using the robvis R package (traffic-light and summary plots; McGuinness & Higgins, 2021)

## Statistical Analysis
### Pairwise Meta-analysis
Not applicable as a distinct pooling step: each direct comparison (one CAR-T therapy vs. standard of care) is informed by exactly one trial, so there is no between-study pooling to perform at the pairwise level. The pairwise() function in the netmeta R package is used only to reshape arm-level data into the contrast-based long format the network model requires.
### Network Meta-analysis
Frequentist network meta-analysis via the netmeta R package. The binary outcome (CR, with ORR as a secondary outcome) is modeled on the log odds ratio scale. A common-effect (fixed-effect) model is specified as the primary analysis, since between-study heterogeneity cannot be separated from sampling error when each comparison is informed by a single trial. Standard of care is set as the reference treatment. Outputs are a network graph, a league table of all pairwise estimates (direct and indirect), a forest plot versus standard of care, and P-score treatment rankings.
### Assessment of Heterogeneity
Not formally estimable in this network. Standard between-study heterogeneity statistics (τ², I²) require multiple trials informing the same comparison, and every edge in this network is informed by exactly one trial. This is reported as a structural limitation of the evidence base, not as a heterogeneity estimate of zero.
### Assessment of Transitivity
Assessed qualitatively, by comparing baseline characteristics (age, prior lines of therapy, disease stage) and trial-design features (bridging-therapy policy, crossover provisions, response-adjudication method) across the three trials' standard-of-care arms, to evaluate whether they plausibly estimate a common underlying comparator.
### Assessment of Consistency
Not assessable in this network. Consistency — agreement between direct and indirect evidence — can only be evaluated where a closed loop exists, giving both direct and indirect evidence for the same comparison. This network is star-shaped: all three CAR-T therapies connect only through the shared standard-of-care comparator, with no direct CAR-T-versus-CAR-T trial, so no closed loop exists and node-splitting is not applicable.
### Treatment Ranking
P-scores (netmeta's frequentist analogue to SUCRA), interpreted alongside point estimates and confidence intervals rather than in isolation, given the wide uncertainty expected from a three-trial network.
### Sensitivity Analyses
The network model is re-estimated using ORR in place of CR, to check whether treatment ranking and direction of effect hold across the two response definitions. Where TRANSFORM's interim and primary analyses differ, the primary analysis is used as the base case and the interim analysis as a secondary check. As an external plausibility check rather than a pre-specified statistical method, results are also compared qualitatively, in direction and rough magnitude, against published matching-adjusted indirect comparisons of these same three products.

## Confidence in the Evidence
Assessed qualitatively using the CINeMA framework (Nikolakopoulou et al., 2020) across five domains — within-study bias, indirectness, imprecision, heterogeneity, and incoherence — each rated High/Moderate/Low/Very low with a brief justification, rather than using the formal CINeMA web application.

## References
References will be managed using the references.bib bibliography file