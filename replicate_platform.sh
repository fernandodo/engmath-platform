#!/bin/bash
set -e

# Get the directory where this script resides (the platform root)
PLATFORM_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Usage: replicate_platform.sh [project_directory]
# Default to current directory if no argument provided
DEST=${1:-.}

if [ ! -d "$DEST" ]; then
  echo "Creating directory: $DEST"
  mkdir -p "$DEST"
fi

# Convert DEST to absolute path for clear output
ABS_DEST="$( cd "$DEST" &> /dev/null && pwd )"

echo "Exporting platform snapshot from $PLATFORM_DIR to $ABS_DEST..."

# 一键同步：环境引擎 (Makefile) + 当前平台快照 (Requirements & Constraints) + 使用说明 (PLATFORM_USAGE.md)
cp "$PLATFORM_DIR/Makefile" "$PLATFORM_DIR/requirements.txt" "$PLATFORM_DIR/constraints.txt" "$PLATFORM_DIR/PLATFORM_USAGE.md" "$ABS_DEST/"

echo "------------------------------------------------"
echo "Platform Snapshot exported to: $ABS_DEST"
echo "Included files:"
echo "  - Makefile (The engine)"
echo "  - requirements.txt (The intent)"
echo "  - constraints.txt (The fixed recipe)"
echo "  - PLATFORM_USAGE.md (Usage instructions)"
echo ""
echo "To replicate this environment in the project directory:"
echo "  cd $DEST"
echo "  make install"
echo "  Activation:"
echo "    Bash/Zsh: source .venvs/platform/bin/activate"
echo "    Fish:     source .venvs/platform/bin/activate.fish"
echo "Note: This will use the snapshot (requirements.txt & constraints.txt) in $DEST."
echo "------------------------------------------------"
