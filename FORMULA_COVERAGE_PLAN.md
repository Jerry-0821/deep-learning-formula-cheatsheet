# Formula Coverage Plan

Project: `deep-learning-formula-cheatsheet`

Goal: build a compact LaTeX/PDF mathematical reference for deep learning
formulas, tensor shapes, update rules, common variants, and minimal labels.

This document tracks the formula coverage map, notation conventions, section
structure, and verification checklist for the current draft.

## Framework Rules

- Keep the project formula-focused.
- This is a compact mathematical PDF reference, not a tutorial, not a textbook,
  and not a long explanation document.
- Prefer formulas, tensor shapes, update rules, common variants, and minimal
  labels.
- Do not add long derivations unless the derivation itself is the reference
  item.
- Do not expand scope from external sources. External sources only verify
  formulas, shapes, and notation for topics already in the coverage map.

## Formula Entry Standard

Each formula entry should include only:

- Formula name
- Formula
- Shapes
- Use: one short phrase
- Notes: optional, at most 1-2 bullets

## Layout Standard

The PDF classifies topics into four layout types.

### Type A: Process / Pipeline Topic

Used where a full mathematical process matters.

Examples:

- Logistic Regression
- Forward Propagation
- Backpropagation
- Optimization
- Batch Normalization
- RNN / LSTM
- Attention
- Transformer Block

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

Rules:

- Include the whole general mathematical pipeline.
- Do not insert numerical examples.
- Do not write long intuition paragraphs.

### Type B: Formula Table Topic

Used for mostly standalone formulas.

Examples:

- Activation Functions
- Loss Functions
- Initialization
- Regularization formulas
- Metrics

Required structure:

- Compact formula table
- Derivative / gradient column where useful
- Range / output type column where useful
- One short use phrase only when necessary
- Symbol notes only when symbols are not obvious

### Type C: Shape Rule Topic

Used where output dimensions and tensor compatibility are central.

Examples:

- CNN output size
- Pooling output size
- CNN parameter count
- RNN hidden-state shapes
- Transformer Q/K/V shapes
- Shape reference tables

Required structure:

- Input shape
- Formula for output shape
- Output shape
- Parameter shape, if relevant
- Symbol table

### Type D: Architecture / Objective Topic

Used for architecture patterns or objective formulas.

Examples:

- ResNet
- Inception
- YOLO
- Triplet Loss
- Neural Style Transfer
- Beam Search
- Transformer Block

Required structure:

- Core pattern or objective formula
- Symbols
- Shape notes, if relevant
- Compact variants only if important

## Formula Verification Checklist

Before adding any formula:

- Is the notation consistent?
- Are matrix dimensions compatible?
- Is the batch dimension clear?
- Is the formula for a single example or vectorized batch?
- Is the loss for binary, multi-class, or sequence output?
- Are broadcasting assumptions stated?
- Are CNN padding/stride conventions clear?
- Are RNN hidden-state dimensions clear?
- Are Transformer Q/K/V dimensions clear?
- Is the formula directly supported by the provided files or verified by an external authoritative source?

## Consistent Notation System

Core batch convention:

- `m`: number of examples in a batch
- `n_x`: input dimension
- `n_y`: output dimension
- `L`: number of layers
- `n^{[l]}`: number of units in layer `l`
- `n^{[0]} = n_x`
- `X = A^{[0]} \in \mathbb{R}^{n_x \times m}`
- `Y \in \mathbb{R}^{n_y \times m}`
- `x^{(i)} \in \mathbb{R}^{n_x \times 1}`
- `y^{(i)} \in \mathbb{R}^{n_y \times 1}`
- `W^{[l]} \in \mathbb{R}^{n^{[l]} \times n^{[l-1]}}`
- `b^{[l]} \in \mathbb{R}^{n^{[l]} \times 1}`
- `Z^{[l]}, A^{[l]} \in \mathbb{R}^{n^{[l]} \times m}`
- `dZ^{[l]}, dA^{[l]} \in \mathbb{R}^{n^{[l]} \times m}`
- `dW^{[l]} \in \mathbb{R}^{n^{[l]} \times n^{[l-1]}}`
- `db^{[l]} \in \mathbb{R}^{n^{[l]} \times 1}`

Index convention:

- `(i)`: example index
- `[l]`: neural-network layer index
- `<t>`: sequence time-step index
- `{k}`: mini-batch index

Do not use `{t}` for mini-batches because `t` is reserved for sequence time
steps and may also appear in optimizer-step notation.

Default dense-layer equation:

```tex
Z^{[l]} = W^{[l]} A^{[l-1]} + b^{[l]},
\qquad
A^{[l]} = g^{[l]}(Z^{[l]}).
```

Broadcasting convention:

- Bias vectors are column vectors and broadcast across the batch axis.
- Elementwise operations require identical or broadcast-compatible shapes.

CNN convention:

- Single image shape: `H x W x C`
- Batch shape: `m x H x W x C` unless stated otherwise
- Use `f` for filter size, `p` for padding, `s` for stride
- Use NHWC as the main formula convention.
- PyTorch commonly uses NCHW: `m x C x H x W`.
- Do not mix NHWC and NCHW in main formulas. Put the mapping in the shape
  reference appendix.

Sequence convention:

- `x^{<t>} \in \mathbb{R}^{n_x \times m}`
- `a^{<t>} \in \mathbb{R}^{n_a \times m}`
- `c^{<t>} \in \mathbb{R}^{n_a \times m}` for LSTM cell state
- `T_x`: input sequence length
- `T_y`: output sequence length

Transformer convention:

- `d_model`: model width
- `d_k`: key/query width
- `d_v`: value width
- `Q \in \mathbb{R}^{T_q \times d_k}`
- `K \in \mathbb{R}^{T_k \times d_k}`
- `V \in \mathbb{R}^{T_k \times d_v}`
- Start section 18 with simplified single-head notation.
- Batch shape reference: `Q \in \mathbb{R}^{m \times T_q \times d_k}`
- Multi-head shape reference:
  `Q \in \mathbb{R}^{m \times h \times T_q \times d_k}`
- Include both post-norm and pre-norm residual variants later, but do not
  expand them in the framework step.

## Final PDF Section Structure

Use the requested structure with minor filename normalization:

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

## Scope Split

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

## Formula Coverage Map

### 01 Notation and Tensor Shapes

Include:

- Batch matrix convention
- Single-example vs vectorized notation
- Dense layer parameter shapes
- Activation and gradient shapes
- Mini-batch notation
- CNN spatial/channel notation
- NHWC main convention and NCHW mapping note
- Sequence notation
- Transformer Q/K/V notation
- Batch and multi-head Transformer shape references
- Broadcasting assumptions

Primary sources:

- C1 notes and transcripts
- C4 notes for CNN notation
- C5 notes for sequence and Transformer notation

### 02 Logistic Regression and Binary Classification

Status: drafted, pending human verification.

Include later:

- Binary logit: `z = w^T x + b`
- Sigmoid output: `a = sigma(z)`
- Prediction: `hat y = P(y=1|x)`
- Binary cross-entropy single-example loss
- Vectorized cost over `m` examples
- Gradients: `dz`, `dw`, `db`
- Vectorized shapes for `X`, `w`, `b`, `A`, `Y`

Primary sources:

- C1 W2 notes and transcript

### 03 Forward Propagation

Status: drafted, pending human verification.

Include later:

- Dense layer affine step
- Dense layer activation step
- Deep network composition
- Cache notation for backpropagation
- Output-layer conventions for sigmoid and softmax
- Vectorized batch equations

Primary sources:

- C1 W3 and W4 notes

### 04 Activation Functions

Status: drafted, pending human verification.

Include later:

- Sigmoid and derivative
- Tanh and derivative
- ReLU and derivative
- Leaky ReLU and derivative
- Softmax
- Softmax Jacobian reference
- Saturation notes for sigmoid/tanh

Primary sources:

- C1 W3 notes
- Interview questions PDF

### 05 Loss and Cost Functions

Status: drafted, pending human verification.

Include later:

- Binary cross-entropy
- Multiclass cross-entropy
- Softmax negative log-likelihood
- Mean squared error
- Sequence negative log-likelihood
- Regularized cost with L2

Primary sources:

- C1 W2-W4 notes
- C5 sequence model notes
- DeepLcheat sheet

### 06 Backpropagation

Status: drafted, pending human verification.

Include later:

- `dZ^{[l]} = dA^{[l]} \odot g'^{[l]}(Z^{[l]})`
- `dW^{[l]} = (1/m) dZ^{[l]} A^{[l-1]T}`
- `db^{[l]} = (1/m) sum_i dZ^{[l](i)}`
- `dA^{[l-1]} = W^{[l]T} dZ^{[l]}`
- Sigmoid plus BCE simplification: `dZ = A - Y`
- Softmax plus CE simplification
- Shape compatibility checks

Primary sources:

- C1 W2-W4 notes and transcripts
- C2 Chinese notes for derivation checks

### 07 Gradient Descent and Optimization

Status: drafted, pending human verification.

Include later:

- Batch gradient descent
- Mini-batch gradient descent
- Exponentially weighted average
- Momentum
- RMSProp
- Adam with bias correction
- Learning-rate decay variants
- Update-rule table by optimizer

Primary sources:

- C2 W2 notes and transcripts
- DeepLcheat sheet
- Interview questions PDF

### 08 Initialization

Status: drafted, pending human verification.

Include later:

- Zero initialization failure for weights
- Random small initialization
- Xavier/Glorot initialization
- He initialization
- Bias initialization
- Variance notes by activation

Primary sources:

- C1 W3 notes
- C2 notes
- Interview questions PDF

### 09 Regularization

Status: drafted, pending human verification.

Include later:

- L2 regularized cost
- L2 gradient term
- Weight decay update form
- Inverted dropout mask and scaling
- Dropout train/test convention
- Early stopping label
- Data augmentation label

Primary sources:

- C2 W1 notes and transcripts
- Interview questions PDF

### 10 Batch Normalization

Status: drafted, pending human verification.

Include later:

- Mini-batch mean
- Mini-batch variance
- Normalized activation
- Scale and shift with `gamma`, `beta`
- Running mean/variance
- Train vs inference equations
- Parameter shapes

Primary sources:

- C2 W3 notes and transcripts
- Interview questions PDF

### 11 Convolutional Neural Networks

Status: drafted, pending human verification.

Include later:

- 2D convolution output size
- Padding and stride conventions
- Valid vs same convolution
- Filter parameter count
- Multi-channel convolution shape
- Pooling output size
- Max pooling and average pooling
- 1x1 convolution
- Dilated convolution
- Transposed convolution shape note

Primary sources:

- C4 W1 notes and transcripts
- Interview questions PDF
- CS231n planned verification if needed

### 12 Classic CNN Architectures

Status: drafted, pending human verification.

Include later:

- LeNet compact table
- AlexNet compact table
- VGG block pattern
- Residual block: `a^{[l+2]} = g(z^{[l+2]} + a^{[l]})`
- Inception concatenation
- 1x1 bottleneck parameter reduction

Primary sources:

- C4 W2 notes and transcripts

### 13 Object Detection and YOLO

Status: drafted, pending human verification.

Include later:

- Bounding box representation
- Intersection over Union
- Non-max suppression rule
- Anchor-box assignment
- Course-style YOLO grid output shape:
  `S \times S \times (B \cdot 5 + C)`
- Objectness score
- Class probability score
- Mean average precision label
- Short note only: modern YOLO variants may use different head designs

Primary sources:

- C4 W3 notes and transcripts

### 14 Face Recognition and Neural Style Transfer

Status: drafted, pending human verification.

Include later:

- Embedding function `f(x)`
- Pairwise distance
- Siamese network notation
- Triplet loss
- Content cost
- Gram matrix
- Style cost
- Total neural style transfer objective

Primary sources:

- C4 W4 notes and transcripts

### 15 RNN / GRU / LSTM

Status: drafted, pending human verification.

Include later:

- Vanilla RNN hidden update
- RNN output prediction
- Sequence loss
- BPTT label and recurrence dependency
- GRU update/reset/candidate gates
- LSTM forget/input/output gates
- LSTM candidate cell and cell update
- Bidirectional RNN concatenation
- Hidden and cell-state shapes

Primary sources:

- C5 W1 notes and transcripts
- Interview questions PDF

### 16 Word Embeddings and Language Models

Status: drafted, pending human verification.

Include later:

- One-hot vector
- Embedding lookup
- Embedding matrix shape
- Cosine similarity
- Analogy objective
- Language-model softmax
- Cross-entropy over vocabulary
- Perplexity

Primary sources:

- C5 W2 notes and transcripts
- Stanford-style cheat sheets

### 17 Seq2Seq, Beam Search, and Attention

Status: drafted, pending human verification.

Include later:

- Conditional sequence probability
- Encoder-decoder hidden-state notation
- Beam-search score
- Length normalization
- Attention energy
- Attention weights
- Context vector

Primary sources:

- C5 W3 notes and transcripts

### 18 Transformer and Self-Attention

Status: drafted, pending human verification.

Include later:

- Scaled dot-product attention
- Causal mask
- Multi-head attention
- Output projection
- Position-wise feed-forward network
- Positional encoding
- Residual connection
- Layer normalization
- Q/K/V shape table
- Simplified single-head notation first:
  `Q \in \mathbb{R}^{T_q \times d_k}`,
  `K \in \mathbb{R}^{T_k \times d_k}`,
  `V \in \mathbb{R}^{T_k \times d_v}`
- Batch shape reference:
  `Q \in \mathbb{R}^{m \times T_q \times d_k}`
- Multi-head shape reference:
  `Q \in \mathbb{R}^{m \times h \times T_q \times d_k}`
- Pre-norm and post-norm residual variants as compact formulas

Primary sources:

- C5 W4 notes and transcripts
- CS224n or Dive into Deep Learning planned verification if needed

### 19 ML Strategy Formula Appendix

Status: drafted, pending human verification.

Include later:

- Confusion matrix labels
- Precision
- Recall
- F1 score
- Accuracy and error rate
- Avoidable bias gap
- Variance gap
- Data mismatch gap
- Error-analysis fraction
- Train/dev/test split notation

Primary sources:

- C2 notes for bias/variance
- C3 notes and transcripts

### 20 Shape Reference Tables

Status: drafted, pending human verification.

Include later:

- Dense layer shapes
- Logistic regression shapes
- CNN layer shapes
- Pooling shapes
- RNN/GRU/LSTM shapes
- Embedding shapes
- Attention and Transformer shapes
- Optimizer accumulator shapes

Primary sources:

- All C1-C5 notes

## Topics Intentionally Deferred or Excluded

- GAN, VAE, diffusion models, reinforcement learning, modern YOLO variants, and
  advanced Transformer variants are V2 deferred topics.
- Full GAN derivations are excluded from V1. The interview PDF mentions GANs,
  but the V1 structure does not require a GAN section.
- Long derivations and beginner intuition paragraphs are excluded by design.

## Human Verification Needed Before Full Writing

- Whether the final PDF should include any framework batch-first mapping beyond
  the dedicated shape reference tables.
- Whether the NHWC-to-NCHW mapping should be shown once in section 20 only, or
  also briefly in section 11.
- Whether Transformer formulas should include pre-norm and post-norm variants.
- Whether Chinese notes should influence wording, or only formula selection.

## Source Rule

- Primary sources are the provided workspace materials.
- External sources should only verify formulas, shapes, and notation.
- External sources must not expand the scope unless the topic is already in the
  coverage map.
- Do not blindly copy external cheat sheets.
- Standard mathematical formulas may be included, but surrounding notes should
  be original and compact.
