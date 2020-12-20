#!/bin/bash

# Simple script to list Python Installs by searching common install locations

echo "Python Installs:"
ls -1 /usr/bin/python* | grep '[2-3].[0-9]$'
ls -1 /usr/local/bin/python* | grep '[2-3].[0-9]$'
echo ""
# Show what python and python3 are set too
PY="$(which python)"
PYV="$(python --version 2>&1)"
PY3="$(which python3)"
PY3V="$(python3 --version 2>&1)"

echo "Commands are set to:"
echo "python: ${PY} version: ${PYV}"
echo "python3: ${PY3} version: ${PY3V}"