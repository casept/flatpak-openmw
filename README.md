# flatpak-openmw    

A flatpak package for openmw, a morrowind engine replacement.      

## Building     
First checkout the repo:     
```
git clone https://github.com/casept/flatpak-openmw     
cd flatpak-openmw      
git submodule init     
git submodule update     
```

Install the needed runtime and SDK:        
```
flatpak remote-add --user --if-not-exists --from gnome https://sdk.gnome.org/gnome.flatpakrepo       
flatpak install --user gnome org.freedesktop.Sdk 1.4      
flatpak install --user gnome org.freedesktop.Platform 1.4          
```

If you wish to build the latest release:         
```    
make     
```     
 
If you wish to build a nightly from master:         
```    
make -f Makefile-nightly     
```     

Whichever one you choose, get ready to leave your PC alone for a few hours. A lot of heavy dependencies (ffmpeg, openscenegraph, Qt4 to name a few) will get compiled. This process took about 200 minutes on my T400 with a cold ccache. With a warm ccache build time goes down to about 30 minutes. The ccache is shared between `release` and `nightly` builds, so you'll only have to compile from scratch once, even if you choose to build both.      
It also pulls down about 1GB of tarballs, so make sure your connection is unmetered before building.

## Installation      
Just run `make install` if you have built the latest `release`, or `make -f Makefile-nightly install` if you have built the latest nightly. This will install the engine only for your user.        
If you wish to install systemwide you'll have to run       
```     
flatpak install --bundle openmw-0.41.0.flatpak     
```     
for `release`, or
```
flatpak install --bundle openmw-nightly.flatpak     
```     
for `nightly` manually.      

## Running        
In most desktop environments an openMW menu entry will have been created under games. If that's not the case you may need to log out and back in again. If you still can't find the icon your DE might not be looking in the directory where flatpak places .desktop files. If that's the case you'll have to run `flatpak run org.openmw.openmw` manually.

## Accessing save games/mods/etc.
For sandboxing reasons the game is configured to save user data to `~/.var/app/org.openmw.openmw/.openmw` instead of the usual `~/.openmw`. This directory will have the same structure as it does when openMW is installed systemwide by normal means.

## Regarding the creation set
The shortcut to the creation set will not show up in your DE due to a flatpak limitation which only lets you export one .desktop file at a time. I'm investigating a workaround for this. Meanwhile, you can run `flatpak run --command=openmw-cs org.openmw.openmw` to start the creation set from the CLI.
