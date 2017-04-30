all:
	rm -rf openmw
	flatpak-builder --repo=repo --ccache openmw org.openmw.openmw.json 
	flatpak build-bundle repo openmw-0.41.0.flatpak org.openmw.openmw stable
clean:
	rm -rf build repo openmw *.flatpak .flatpak-builder
install:
	flatpak install --user --bundle openmw-0.41.0.flatpak
uninstall:
	flatpak uninstall --user org.openmw.openmw
