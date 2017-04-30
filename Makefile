all:
	rm -rf openmw
	flatpak-builder --repo=repo --ccache openmw org.openmw.openmw.json 
	flatpak build-bundle repo openmw-0.41.0.flatpak org.openmw.openmw
	# Flatpak doesn't allow export of several .desktop files, that's why we build the creation set separately
	rm -rf openmw
	flatpak-builder --repo=repo --ccache openmw org.openmw.openmw-cs.json 
	flatpak build-bundle repo openmw-cs-0.41.0.flatpak org.openmw.openmw-cs
clean:
	rm -rf build repo openmw *.flatpak .flatpak-builder
install:
	flatpak install --user --bundle openmw-0.41.0.flatpak
	flatpak install --user --bundle openmw-cs-0.41.0.flatpak
uninstall:
	flatpak uninstall --user org.openmw.openmw
	flatpak uninstall --user org.openmw.openmw-cs
