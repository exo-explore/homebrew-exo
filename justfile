debug:
	# ignore errors uninstalling.
	brew update
	brew uninstall exo || true
	brew install -s exo --debug --verbose
