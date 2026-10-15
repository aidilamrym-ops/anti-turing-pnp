# GAP-PNP.md — the precise P-vs-NP entailment gap (binding)

Status: the kernel proves real-analysis facts; NOTHING in this
repository currently bridges them to P vs NP. This file exists so
that the gap is a documented engineering backlog, not a silent
absence. It is referenced normatively by README.md ("Scope note").

## What IS proven (verified artifacts)

1. Six Lean theorems about `tau_LTC`, `bypass_selector`,
   `continuous_energy` (`AntiTuringCore.lean`, 0 sorry, axiom
   footprint exactly propext/Classical.choice/Quot.sound).
2. Two Z3 batches return UNSAT on their own encodings
   (batch 1: an implication; batch 2: the numeric instance n >= 100).

## What is MISSING (each item blocks the entailment independently)

- **(G1) No complexity vocabulary.** The formalization contains no
  definitions of Turing machines, P, NP, SAT, or polynomial time.
  A resolution of P vs NP must speak about these objects; nothing
  here does.
- **(G2) No reduction bridge.** There is no Cook-Levin style
  reduction connecting SAT instances to the ODE trajectories. The
  inequality `continuous_energy < 2^n` compares two author-defined
  reals; it is not a statement about computation.
- **(G3) Analog time is not Turing time.** Continuous-time O(1)
  dynamics do not transfer to discrete Turing complexity without a
  cost model that prices precision, discretization, and readout.
  The continuous-time computation literature shows unbounded
  precision smuggles infinity back in -- the exact thing the
  anti-infinity stance forbids. Barrier results (relativization and
  successors) are unaddressed.
- **(G4) `SAT_relaxed` is not SAT.** The selector reaching 0 on a
  relaxed criterion decides a different problem than SAT.

## What WOULD close the gap (honest scale)

Formalize Turing machines + P/NP + Cook-Levin in Lean
(community-scale, multi-year); prove the ODE decides SAT with
explicit polynomial overhead INCLUDING precision and readout
costs; address the barrier theorems. Until then the headline stays
corrected per README.md, and this file stays open.

## Non-goals of this file

This file does not argue P = NP or P != NP. It argues that the
current artifacts decide neither, and records what would.
