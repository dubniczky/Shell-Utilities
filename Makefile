# These commands are mainly used for development and testing.

# Enable execution on scripts
enable::
	@chmod u+x scripts/*

# Install scripts to local binaries folder
install::
	@chmod u+x install.sh
	@./install.sh
