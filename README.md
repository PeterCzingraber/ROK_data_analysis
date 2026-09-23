# ROK_data_analysis

Analysis code for the ROK project, a preregistered study of the congruency sequence effect (CSE) and its modulation by previous-trial response speed, run in two stimulus versions (arrow and word).

## Repository structure

```
ROK_arrow_analysis.Rmd    Full pipeline for the arrow-version task
ROK_words_analysis.Rmd    Full pipeline for the word-version task
dienes_bayes.R            Dienes's Bayes factor function (old_Bf), sourced by both .Rmd files
inlab_pilot.csv           Raw in-lab pilot data (jsPsych export)
raw_arrow_data.csv        Cleaned, de-identified trial-level data (arrow version)
raw_word_data.csv         Cleaned, de-identified trial-level data (word version)
weissman-analysis/        Exploratory work modeled on Weissman et al. (2026)
```

Each `.Rmd` covers the same pipeline for its task version:

1. **Import & clean** the raw jsPsych export, reconstruct subject IDs, and extract demographics.
2. **Flag practice vs. experimental trials** and keep only experimental task rows.
3. Write out a de-identified `raw_*.csv` (no personal data) — this is the file used to reproduce everything downstream.
4. **Trial-level cleaning**: flag previous-trial accuracy/RT, exclude participants below 70% accuracy or who took longer than 40 minutes, drop error trials, post-error trials, first-of-block trials, and RTs < 150 ms.
5. **Descriptive statistics & plots**: RT density, congruency-effect violin plots, participant-level CSE distribution.
6. **Confirmatory tests**: repeated-measures ANOVA on RT (congruency × previous congruency), paired t-tests for the main congruency effect (H1) and the CSE (H2), each followed by a Dienes Bayes factor with a robustness range.
7. **RT-speed analysis**: previous-trial RT split into fast/slow tertiles (within participant and previous congruency), manipulation check, CSE modulation (fast vs. slow), TOST + Bayes factor tests against a 5 ms equivalence bound (H3), following Weissman et al. (2026).

## Reproducing the analysis

Open either `.Rmd` in RStudio. Required packages: `tidyverse`, `dplyr`, `tidyr`, `lmerTest`, `papaja` (for plot theming). `dienes_bayes.R` must be in the working directory.

To skip the raw-import step and start from the shared, de-identified data, load `raw_arrow_data.csv` / `raw_word_data.csv` directly and begin from the "Importing raw data" section.

## Data & privacy

`inlab_pilot.csv` is the direct jsPsych export. The `raw_*.csv` files are the cleaned, de-identified versions committed for reproducibility — no names, free-text responses, or other identifying information are retained.