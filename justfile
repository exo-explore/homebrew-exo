debug:
	# ignore errors uninstalling.
	brew uninstall exo || true
	brew install exo --debug --verbose
