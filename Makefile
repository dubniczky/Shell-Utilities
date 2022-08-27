# These commands are mainly used for development and testing.
install_target := /usr/local/bin/


# Enable execution on scripts
enable::
	@chmod u+x scripts/*

# Install scripts to local binaries folder
install::
	@$(MAKE) -s enable
	@cp -f scripts/* $(install_target)
	@echo "Installed $(shell ls scripts | wc -l | xargs echo) scripts to $(install_target)"
