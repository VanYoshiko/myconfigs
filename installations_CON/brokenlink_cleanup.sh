#!/bin/sh


cd "$HOME/Documents/bin" && {
echo "Cleaning broken syn-links..."
for file in *; do
if [ -L "$file" ] && [ ! -e "$file" ]; then
	echo "Removing broken symlink: $file"
	rm "$file"
fi
done
}
cd "$HOME/Documents/bin" && {
	echo "Remove non-functional tools..."
rm -f node npm pyright ruff 2>/dev/null
}
echo -e "\nTesting install tools:"
echo " Cleanup complete. Current content:" 
for tool in flake8 mypy pylint; do
		if command -v "$tool" >/dev/null && "$tool" --version >/dev/null 2>&1; then
			echo "✅ $tool: $("$tool" --version 2>/dev/null | head -n1)"
		else
			echo "❌  $tool not functioning properly"
		fi
done

	echo -e "\nFinal ~Documents/bin content:"
ls -l "$HOME/Documents/bin"
