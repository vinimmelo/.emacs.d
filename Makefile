install:
	rsync .doom.d/ ~/.doom.d
	echo "Succesfull installed in ~/.doom.d folder"

dependencies:
	apt install ripgrep ctags

python:
	python3 -m pip install pytest nose black pyflakes isort pylint
