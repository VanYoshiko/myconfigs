#!/bin/sh

python3 -m pip install --user \
	black \
	isort \
	pyflakes \
	pylint \

for tool in black isort pyflakes pylint; do
		$tool --version
done
	
