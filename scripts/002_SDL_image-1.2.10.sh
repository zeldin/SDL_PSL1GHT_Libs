wget --continue http://www.libsdl.org/projects/SDL_image/release/SDL_image-1.2.10.tar.gz || { exit 1; }

tar xfvz ./SDL_image-1.2.10.tar.gz || { exit 1; }

cd SDL_image-1.2.10 || { exit 1; }

cat ../patches/SDL_image-1.2.10.patch | patch -p1 || { exit 1; }

./configure --prefix="$PS3DEV/portlibs/ppu" --host=ppu \
	--disable-sdltest \
	--with-sdl-exec-prefix="$PS3DEV/portlibs/ppu" \
	--disable-shared \
	LIBPNG_CFLAGS="`$PS3DEV/portlibs/ppu/bin/libpng-config --cflags`" \
	LIBPNG_LIBS="`$PS3DEV/portlibs/ppu/bin/libpng-config --libs`" \
    	|| { exit 1; }

make && make install || { exit 1; }
