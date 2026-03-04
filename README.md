# Engineering Math Platform

## 1. Introduction

This document describes an **Engineering Math Platform** for engineering derivations, symbolic computation, control system modeling, and automated analysis.

The platform is designed to be:

- **Stable and reproducible** (consistent results over time)
- **Reusable across many projects** (one shared toolchain)
- **Automation-friendly** (easy for scripts/AI agents to run and debug)

---

## 2. Design Philosophy: "Record the Recipe, Not the Product"

The platform follows a unified strategy for long-term project viability:

1. **Main Environment Stays Current:** The platform's shared environment is continuously upgraded to the latest stable versions of the scientific stack.
2. **Projects Save Recipes:** Every project should maintain its own `requirements.txt` and `constraints.txt`.
3. **Two-Path Recovery:** If a platform upgrade breaks an existing project, the user chooses one of two paths:
   - **Path A (Preferred):** Patch the project's code to be compatible with the new platform environment.
   - **Path B (Fallback):** Use the project's saved "recipe" to recreate a dedicated virtual environment for that specific project to reproduce original results.

---

## 3. Platform Software Stack

- **Symbolic Math:** SymPy
- **Numerical Computing:** NumPy, SciPy
- **Control Systems:** python-control
- **Visualization:** Matplotlib
- **Interactive:** Jupyter Notebook
- **Testing:** pytest

---

## 4. Platform Layout and Integration

### 4.1 Folder Structure

The platform folder contains the shared environment and global constraints. Projects live in external directories.

```text
engmath/                          # Platform root
├── .venvs/                       # Shared virtual environment
├── requirements.txt             # Dependency list (意图/Intent)
├── constraints.txt              # Shared version pins (配方/Recipe)
├── Makefile                     # Automation (install/upgrade/check)
├── setup_platform.sh            # Initialization / Refresh
└── replicate_platform.sh        # Infrastructure export to projects
```

### 4.2 Key Concepts

- **Single shared environment:** Used for daily work and cross-project consistency.
- **Recipe-based reproduction:** `requirements.txt` + `constraints.txt` ensure that anyone can reconstruct the exact environment state that was used at a point in time.

---

## 5. Dependency Management

### 5.1 The Two-File Strategy

**requirements.txt (What I need / Intent)**
Lists package names with optional minimum versions.

**constraints.txt (What worked / Recipe)**
Lists exact version pins (`==`). Ensures behavioral consistency during reproduction.

### 5.2 Workflow

- **Standard Setup:** `make install` (Installs based on current `requirements.txt` and `constraints.txt`)
- **Platform Refresh:** `make upgrade` (Installs latest versions and refreshes both `requirements.txt` and `constraints.txt`)

---

## 6. Execution Modes

- **Notebook Mode:** For derivations and interactive experiments.
- **Script Mode:** For batch runs and automation.
- **Testing Mode:** For regression tests using `pytest`.

---

## 7. Design Principles

1. **Stability over novelty:** Prioritize reproducibility.
2. **Separation of computation and presentation:** Logic in Python modules; Notebooks for exploration.
3. **Single toolchain across many projects:** Avoid environment fragmentation.
4. **Minimal Verification Points:** Projects should include small "sanity check" tests to quickly detect if a platform upgrade has shifted numerical results.
