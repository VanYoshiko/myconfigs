#!/bin/sh

for tools in flake8 mypy pylint; do
if command -v >/dev/null; then
	echo "✅ $tool $($tool: --version 2>/dev/null | head -n1)"
else
	echo "❌ $tool not found"
fi
done

