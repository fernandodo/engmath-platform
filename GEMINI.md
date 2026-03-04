# Engineering Math Platform - Context

## Project Overview
The **Engineering Math Platform** is a unified environment for engineering derivations, symbolic computation, control system modeling, and automated analysis. This directory serves exclusively as the **platform folder**, providing a shared toolchain and virtual environment for external engineering projects.

### Core Technology Stack
- **Language:** Python
- **Symbolic Math:** SymPy (algebra, calculus, Laplace transforms, LaTeX output)
- **Numerical Computing:** NumPy, SciPy (parameter sweeps, signal processing)
- **Control Systems:** `python-control` (Bode plots, root locus, state-space analysis)
- **Visualization:** Matplotlib (engineering charts and trajectories)
- **Interactive Environment:** Jupyter Notebook (MathJax/LaTeX rendering)
- **Validation:** `pytest` (automated regression testing for models)

### Architecture
The platform provides a **single shared virtual environment** (`.venvs/`) intended to be referenced by independent engineering projects located anywhere on the system (external to this folder).

**Platform Folder Structure:**
```text
engmath/                          # This folder (the platform)
├── .venvs/                       # Shared virtual environment for all projects
├── requirements-core.txt        # Core packages (unpinned)
├── constraints.txt              # Version pins (single source of truth)
├── Makefile                     # Automation workflows for the platform
└── README.md                    # Platform documentation and design principles
```

**Project Structure (External):**
External engineering projects are expected to maintain their own directories with the following recommended structure, while leveraging the platform's shared environment:
- `src/`: Core logic and models (Python modules)
- `notebooks/`: Interactive exploration and documentation
- `tests/`: Regression tests (pytest)

## Building and Running
The following workflows are for managing the platform's environment and tools.

- **Environment Setup:** (TODO: Create `requirements-core.txt` and `constraints.txt`)
  - Install core: `pip install -r requirements-core.txt -c constraints.txt`
  - Install project-specific extras: `pip install -r <project_path>/requirements-extra.txt -c constraints.txt`
- **Testing:**
  - Run tests for an external project: `pytest <project_path>/tests/`
- **Execution:**
  - **Notebook Mode:** `jupyter notebook` (Notebooks should be kept in the external project folder)
  - **Script Mode:** `python -m <project_module>` (Using the platform's Python interpreter)
- **Automation:** (TODO: Implement `Makefile` in this directory)
  - `make install`: Sets up/updates the shared environment.
  - `make check`: Runs platform-wide checks.

## Development Conventions
- **Shared Environment:** External projects MUST use the environment in `engmath/.venvs/` to ensure version consistency.
- **Dependency Management:** All dependencies must respect the `constraints.txt` in this platform folder. Project-specific dependencies are added via their own `requirements-extra.txt`.
- **Modularity:** Keep core mathematical models and utilities in Python modules (`src/`) within the external project folders.
- **Validation:** Every model or derivation in an external project should have corresponding regression tests in its `tests/` directory.
- **Stability:** Prioritize reproducibility and consistent results across all projects by adhering to the platform's pinned versions.
