import Lake
open Lake DDList

package «anti_turing_pnp» where
  version := "1.0.0"
  keywords := #["p-vs-np", "anti-turing", "formal-verification", "neural-ode"]
  moreLeanArgs := #[
    "-DautoImplicit=false",
    "-DmaxRecDepth=200000",
    "-DmaxHeartbeats=500000"
  ]

@[default_target]
lean_lib «AntiTuringCore» where
  srcDir := "lean4_kernel"
  roots := #[`AntiTuringCore]