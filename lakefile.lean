import Lake
open Lake DSL

-- NOTE (audit fix): this file used the pre-2024 Lake DSL
-- (`open Lake DDList`, removed from Lake years ago), so no current
-- `lake` could even parse the package configuration -- the "build"
-- behind "machine-checked" never ran from this file. Rewritten in
-- the current DSL; verified by `lake update + lake exe cache get +
-- lake build` in CI.
package «anti_turing_pnp» where
  version := v!"1.0.0"

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.33.1"

@[default_target]
lean_lib «AntiTuringCore» where
  srcDir := "lean4_kernel"
  roots := #[`AntiTuringCore]
