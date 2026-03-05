# Engineering Math Platform - Usage Guide

This project leverages the **Engineering Math Platform** infrastructure for symbolic derivations, numerical analysis, and control system design.

## 1. Core Platform Capabilities

Once the environment is activated, the following tools are available:

- **Symbolic Math (SymPy)**: Formula derivation, Laplace transforms, and matrix algebra with LaTeX rendering in Jupyter.
- **Numerical Computing (NumPy/SciPy)**: Parameter sweeps, numerical solvers, and signal processing.
- **Control Systems (python-control)**: Bode plots, root locus, and state-space analysis.
- **Engineering Visualization (Matplotlib)**: High-quality frequency response and trajectory plotting.
- **Interactive Exploration (Jupyter)**: Run `jupyter notebook` for interactive math and documentation.
- **Automated Validation (pytest)**: Run `pytest` for model regression testing.

---

## 2. Running Environment Modes

### Mode A: Shared Platform (Default/Recommended)
Use the centrally maintained global environment. This ensures you are always using the latest verified toolchain and saves disk space.
- **How to use**:
  - **Bash/Zsh**: `source /home/felux/engmath/.venvs/platform/bin/activate`
  - **Fish**: `source /home/felux/engmath/.venvs/platform/bin/activate.fish`

### Mode B: Local Replication (Isolation/Archival)
Replicate a 100% identical environment locally within this project directory.
- **How to use**:
  1. `make install`
  2. Activate environment:
     - **Bash/Zsh**: `source .venvs/platform/bin/activate`
     - **Fish**: `source .venvs/platform/bin/activate.fish`

---

## 3. Dependency Management Rules (CRITICAL)

To ensure long-term stability and cross-project consistency, the following rules apply:

- **Centralized Management Only**: All packages and tools must be managed via the main platform (`/home/felux/engmath`). **Do not use `pip install` locally** within this project directory.
- **Snapshot Sync**: If the platform adds new tools or updates versions, sync the latest "recipe" to this project by running the platform's `replicate_platform.sh` script.
- **Single Source of Truth**: This project relies on the `requirements.txt` (intent) and `constraints.txt` (recipe) snapshots provided by the platform.

---
*Powered by the Engineering Math Platform infrastructure.*
