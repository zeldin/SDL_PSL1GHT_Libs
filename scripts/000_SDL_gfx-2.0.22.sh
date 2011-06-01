wget --continue http://www.ferzkopp.net/Software/SDL_gfx-2.0/SDL_gfx-2.0.22.tar.gz || { exit 1; }

tar xfvz ./SDL_gfx-2.0.22.tar.gz || { exit 1; }

cd SDL_gfx-2.0.22 || { exit 1; }

cat ../patches/SDL_gfx-2.0.22.patch | patch -p1 || { exit 1; }

./configure --prefix="$PS3DEV/portlibs/ppu" --host=ppu \
	--with-sdl-exec-prefix="$PS3DEV/portlibs/ppu" \
	--without-x \
	--disable-sdltest \
    	|| { exit 1; }

make && make install || { exit 1; }
