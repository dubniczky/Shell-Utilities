# These commands are mainly used for development and testing.
install_script := install.sh
dist := dist


# Enable execution on scripts
enable::
	@chmod u+x scripts/*

# Install scripts to local binaries folder
install::
	@chmod u+x $(install_script)
	@./$(install_script)

# Packages scripts to tarball and zip files
package::
	@mkdir -p $(dist)/utilities
	@cp LICENSE $(dist)/utilities
	@cp readme.md $(dist)/utilities
	@./$(install_script) $(dist)/utilities >/dev/null
	@cd $(dist)/utilities && \
		tar -czf ../utilities.tar.gz * && \
		zip -r ../utilities.zip * \
		>/dev/null 2>&1
	@echo "Scripts packaged to: $(dist)/"
