# Global Consistency Audit

## Summary of Files Checked

Checked `main.tex`, `README.md`, `FORMULA_COVERAGE_PLAN.md`, `SOURCES.md`, and `sections/01_notation.tex` through `sections/20_shape_reference.tex`.

## Notation Issues Found and Fixed

- Updated stale coverage-plan opening wording from first-step language to current-draft tracking language.
- Updated README current status to say all planned sections have draft content and final formula verification, LaTeX compilation, and PDF polish are pending.
- Split one long optimizer note so the optimizer-step use of \(t\) stays clear and compact.

## Shape Issues Found and Fixed

- No major dimensional conflicts found in the audited dense, logistic regression, backpropagation, CNN, RNN/GRU/LSTM, embedding, attention, or Transformer shape pipelines.
- Section 20 agrees with the main NHWC CNN convention and the Transformer Q/K/V single-head, batch, and multi-head batch references.

## LaTeX Readability Issues Found and Fixed

- Reduced one overlong `\Notes{}` line in Section 07.
- Confirmed important formulas remain in display math and planned section files no longer contain TODO placeholders.

## Remaining Formulas Needing Human Verification

- GRU update-gate convention.
- Momentum scaling convention with \((1-\beta)\).
- RMSProp without bias correction.
- Xavier simplified \(1/\mathrm{fan\_in}\) convention.
- BatchNorm running variance moving-average convention.
- CNN multi-channel indexed formula notation.
- Neural style transfer style-cost normalization.
- Bias / variance gap definitions and baseline choice.
- Data mismatch gap convention.
- Transformer FFN row-vector convention and LayerNorm broadcasting notation.

## Compile Status

No local LaTeX engine available.

Structural checks run instead:

- No TODO placeholders in `sections/*.tex`.
- All `\input{}` files referenced by `main.tex` exist.
- `\begin{}` / `\end{}` counts match per checked file.
- Inline math delimiter counts are even per checked file.
- README status is current.
- Sections 02-20 all have first-draft content.

## Build System Status

- GitHub Actions workflow added at `.github/workflows/build-pdf.yml`.
- Workflow is configured to build `main.tex` into `main.pdf`.
- Workflow uploads `main.pdf` as the `deep-learning-formula-cheatsheet-pdf` artifact.
- Local Makefile provides `make pdf`, `make clean`, and `make distclean`.
- `.gitignore` ignores LaTeX build artifacts but does not ignore `main.pdf`.
- Local compilation is still untested because no local LaTeX engine is available.
- Next step: push to GitHub and inspect the Actions result.

## Recommended Next Step

Install or enable a LaTeX engine, compile `main.tex`, then do a PDF layout pass for table width, page breaks, and formula readability.
