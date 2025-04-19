#!/bin/sh
# Test if tools are properly installed after downloading

test_tool() {
 printf "Testing %-10s" "$1..."
if command -v "$1" >/dev/null 2>&1; then
"$1" --version 2>&1 | head -n1 || echo "⚠️Runa ---version check seperate" 
else
	echo "❌ not working"
fi
}

echo "Tool Version"
echo "----------------------"
test_tool black 
test_tool pyflakes 
test_tool pylint 
test_tool mypy 
test_tool isort 

# Cleanup
rm .tmp_*.py 2>/dev/null
