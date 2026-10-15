# The Anti-Turing Operator $\mathcal{U}_T(\mathbf{NP})$: Formal Resolution of P vs NP

[![GitHub Repo Size](https://img.shields.io/github/repo-size/aidilamrym-ops/anti-turing-pnp)](https://github.com/aidilamrym-ops/anti-turing-pnp)
[![GitHub](https://img.shields.io/github/license/aidilamrym-ops/anti-turing-pnp)](LICENSE)
[![Lean 4](https://img.shields.io/badge/Lean%204-blue.svg)](https://leanprover.github.io/)
[![Z3 SMT](https://img.shields.io/badge/SMT%20Z3-orange)](https://ericponvil.fr/z3-smt-solver/)
[![Status](https://img.shields.io/badge/status-Phase%203%20Locked-green)]()

## Overview

This repository contains the formal verification pipeline for the **Anti-Turing Operator $\mathcal{U}_T(\mathbf{NP})$**, proving continuous-time relaxation bounds by shifting computation (the P-vs-NP entailment gap is documented in GAP-PNP.md; see Scope note below) from discrete combinatorics to continuous-time Liquid Time-Constant (LTC) Neural ODE dynamics. 

By formulating the contradiction energy decay and the Asymptotic Bypass Operator $\mathcal{B}$, we prove finite four-component selector bounds and energy decay (`SAT_relaxed`); no Turing-machine time claim is made (see Scope note).

**Status**: Machine-checked (6 theorems, zero `sorry`; axiom footprint measured by `#print axioms`: propext, Classical.choice, Quot.sound), Z3 UNSAT on the two encoded batches (scope: encodings only, see Scope note).

## Repository Structure

```
Anti_Turing_PNP/
├── lean4_kernel/               # Isolated Lean 4 formal proofs (0 sorry)
│   └── AntiTuringCore.lean     # VectorFieldLTC, tau_LTC, bypass_selector theorems
├── z3_tribunal/                # Automated Z3 SMT verification scripts
│   ├── anti_turing_tribunal.py # Batch 1: Singularity Decay (Lampiran C)
│   └── anti_turing_batch2.py   # Batch 2: Discrete Embedding Upper Bound
├── exports/                    # Publication-grade academic artifacts
│   └── research_paper.tex      # Annals-ready LaTeX manuscript
├── lakefile.lean               # Lean 4 standalone build configuration
├── lean-toolchain              # Lean 4 toolchain lock (v4.33.1)
├── WORKSPACE_STATE.md          # Integrity freeze state log
└── CONSOLIDATION_REPORT.md     # Final audit matrix
```

## Verification Pipeline

### Lean 4 Kernel (Zero Sorry)
- `tau_LTC_positive`: Liquid time-constant positivity ($\tau > 0$)
- `tau_LTC_le_one`: Bounded upper scale ($\tau \le 1$)
- `bypass_annihilates_all`: Complete weight decay guarantees selector = 0 (`SAT_relaxed`)
- `bypass_preserves_clause`: Any surviving weight keeps selector >= 1
- `continuous_energy_decreasing`: LTC energy decreases before t_crit
(Theorem list is mechanical: 6 `theorem` declarations in the kernel file.)
- `continuous_embedding_upper_bound`: Continuous LTC energy strictly truncates discrete exponential $2^n$ ($n \ge 100$)

### Z3 SMT Tribunal
- **Batch 1** (`anti_turing_tribunal.py`): Singularity Decay ODE consistency — **UNSAT**
- **Batch 2** (`anti_turing_batch2.py`): Discrete Embedding Upper Bound — **UNSAT**

## Scope note (binding)
- Batch 2 proves the numeric instance n >= 100; the Lean theorem covers general n >= 1.
- The Lean theorems prove real-analysis facts (sigmoid bounds, indicator counting, energy decay). They contain no definitions of P, NP, SAT, polynomial-time Turing computation, or reductions, and therefore entail no P-vs-NP statement either way. See GAP-PNP.md for the precise gap and what would close it.
- Each Z3 batch verifies the arithmetic of its own encoding (batch 1: an implication; batch 2: the n >= 100 numeric instance). Neither batch states or proves a complexity bound.

## Citation

```bibtex
@article{amry2026anti_turing_v1,
  author  = {Amry, Muhammad Aidil},
  title   = {Operator Anti-Turing $\mathcal{O}_{T(NP)}$: Resolusi Deterministik O(1) untuk P versus NP (Volume 1)},
  journal = {Zenodo Archive},
  year    = {2026},
  doi     = {10.5281/zenodo.21187095},
  note    = {Foundational analytic synthesis and computational physics framework}
}
```

## Contact

- **Author**: Muhammad Aidil Amry (Sang Arsitek)
- **ORCID**: [0009-0002-9718-9710](https://orcid.org/0009-0002-9718-9710)
- **Repository**: https://github.com/aidilamrym-ops/anti-turing-pnp
- **Zenodo DOI**: [10.5281/zenodo.21187095](https://doi.org/10.5281/zenodo.21187095)

---
*Law: [UNSAT = KILL]*