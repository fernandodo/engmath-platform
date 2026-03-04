#!/bin/bash
set -e

echo "Initializing/Refreshing Engineering Math Platform..."

# Build/Refresh the environment and update the recipe (constraints.txt)
make upgrade

echo "------------------------------------------------"
echo "Platform setup complete."
echo "Virtual environment: .venvs/platform"
echo "To activate: source .venvs/platform/bin/activate"
echo "------------------------------------------------"
