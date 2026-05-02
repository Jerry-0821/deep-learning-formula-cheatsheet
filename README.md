# deep-learning-formula-cheatsheet

Compact LaTeX formula cheat sheet for deep learning.

This repository is intended to produce a clean PDF reference focused on formulas,
tensor shapes, notation consistency, update rules, common variants, and minimal
labels. It is not a beginner tutorial and not a long explanation document.
It is not a textbook. Keep the project formula-focused.

## Current Status

Current scaffold:

- `main.tex` contains the LaTeX document shell, packages, notation macros, and section inputs.
- `sections/01_notation.tex` contains the initial notation and tensor-shape convention.
- `sections/02_logistic_regression.tex` through `sections/20_shape_reference.tex` are complete draft sections pending human review.
- All planned section files have first-draft content.
- Final formula verification, LaTeX compilation, and PDF polish are pending.
- `FORMULA_COVERAGE_PLAN.md` defines the formula coverage map and verification checklist.
- `SOURCES.md` records primary workspace sources and source policy.

## Build

Local build:

```bash
make pdf
```

Clean local LaTeX artifacts:

```bash
make clean
```

Remove generated PDF:

```bash
make distclean
```

Manual fallback:

```bash
latexmk -pdf main.tex
```

GitHub Actions builds `main.pdf` and uploads it as the
`deep-learning-formula-cheatsheet-pdf` artifact.

## Style Rules

- Keep entries compact.
- Prefer display math for important formulas.
- Add shapes near formulas.
- Use consistent notation from `sections/01_notation.tex`.
- Avoid long derivations unless the derivation itself is the reference item.
- Avoid raw Unicode math symbols when LaTeX commands are clearer.
- Prefer formulas, tensor shapes, update rules, and compact reference tables over prose.
- Do not use external sources to expand project scope.

## Formula Entry Standard

Each formula entry should include only:

- Formula name
- Formula
- Shapes
- Use: one short phrase
- Notes: optional, at most 1-2 bullets

Target LaTeX pattern:

```tex
\FormulaName{Formula name}
\[
...
\]
\Shapes{...}
\Use{one short phrase}
\Notes{one or two short notes only when necessary}
```

## Layout Standard

The PDF uses four layout types:

### Type A: Process / Pipeline Topic

Use for Logistic Regression, Forward Propagation, Backpropagation,
Optimization, Batch Normalization, RNN / LSTM, Attention, and Transformer Block.

Required structure:

- Assumptions / Input Shapes
- Main Process formulas
- Loss / Objective, if relevant
- Backward / Gradients, if relevant
- Update Rule, if relevant
- Symbols and Shapes
- Key Simplifications / Variants, if relevant

Pipeline style:

```tex
X \to Z \to A \to J \to dZ \to dW, db \to \text{update}
```

### Type B: Formula Table Topic

Use for Activation Functions, Loss Functions, Initialization, Regularization
formulas, and Metrics.

Required structure:

- Compact formula table
- Derivative / gradient column where useful
- Range / output type column where useful
- One short use phrase only when necessary
- Symbol notes only when symbols are not obvious

### Type C: Shape Rule Topic

Use for CNN output size, pooling output size, CNN parameter count, RNN
hidden-state shapes, Transformer Q/K/V shapes, and shape reference tables.

Required structure:

- Input shape
- Formula for output shape
- Output shape
- Parameter shape, if relevant
- Symbol table

### Type D: Architecture / Objective Topic

Use for ResNet, Inception, YOLO, Triplet Loss, Neural Style Transfer, Beam
Search, and Transformer Block.

Required structure:

- Core pattern or objective formula
- Symbols
- Shape notes, if relevant
- Compact variants only if important

## Scope

### V1 Core Sections

- 01 Notation and Tensor Shapes
- 02 Logistic Regression
- 03 Forward Propagation
- 04 Activation Functions
- 05 Loss Functions
- 06 Backpropagation
- 07 Optimization
- 08 Initialization
- 09 Regularization
- 10 Batch Normalization
- 11 CNN
- 15 RNN / GRU / LSTM
- 18 Transformer and Self-Attention
- 20 Shape Reference Tables

### V1 Compact Appendix Sections

- 12 Classic CNN Architectures
- 13 Object Detection and YOLO
- 14 Face Recognition and Neural Style Transfer
- 16 Word Embeddings and Language Models
- 17 Seq2Seq, Beam Search, and Attention
- 19 ML Strategy Formula Appendix

### V2 Deferred Topics

- GAN
- VAE
- Diffusion models
- Reinforcement learning
- Modern YOLO variants
- Advanced Transformer variants

## Planned PDF Sections

1. Notation and Tensor Shapes
2. Logistic Regression and Binary Classification
3. Forward Propagation
4. Activation Functions
5. Loss and Cost Functions
6. Backpropagation
7. Gradient Descent and Optimization
8. Initialization
9. Regularization
10. Batch Normalization
11. Convolutional Neural Networks
12. Classic CNN Architectures
13. Object Detection and YOLO
14. Face Recognition and Neural Style Transfer
15. RNN / GRU / LSTM
16. Word Embeddings and Language Models
17. Seq2Seq, Beam Search, and Attention
18. Transformer and Self-Attention
19. ML Strategy Formula Appendix
20. Shape Reference Tables

## Source Policy

Primary sources are the provided workspace materials. External sources should be
used only to verify formulas, shapes, and notation for topics already in the
coverage map. They must not expand the scope unless the topic is already planned.
Every external source used must be recorded in `SOURCES.md`.

## Framework Conventions

- Example index: `(i)`
- Layer index: `[l]`
- Sequence time-step index: `\langle t \rangle`
- Mini-batch index: `\{k\}`
- Main CNN convention: NHWC, with single image `H x W x C` and batch
  `m x H x W x C`
- PyTorch NCHW mapping `m x C x H x W` belongs in the shape reference appendix
- V1 YOLO convention: course-style `S x S x (B * 5 + C)`
- Modern YOLO head variants are deferred to V2
- Transformer starts with simplified single-head `Q`, `K`, `V` shapes, then
  adds batch and multi-head shape references
