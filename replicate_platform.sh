#!/bin/bash
set -e

# Usage: ./replicate_platform.sh <project_directory>
DEST=$1

if [ -z "$DEST" ]; then
  echo "Error: Please provide the project directory."
  echo "Usage: ./replicate_platform.sh /path/to/project"
  exit 1
fi

if [ ! -d "$DEST" ]; then
  echo "Creating directory: $DEST"
  mkdir -p "$DEST"
fi

# 一键同步：环境引擎 (Makefile) + 当前平台快照 (Requirements & Constraints)
cp Makefile requirements.txt constraints.txt "$DEST/"

echo "------------------------------------------------"
echo "Platform Snapshot exported to: $DEST"
echo "Included files:"
echo "  - Makefile (The engine)"
echo "  - requirements.txt (The intent)"
echo "  - constraints.txt (The fixed recipe)"
echo ""
echo "To replicate this environment in the project directory:"
echo "  cd $DEST && make install"
echo "------------------------------------------------"
