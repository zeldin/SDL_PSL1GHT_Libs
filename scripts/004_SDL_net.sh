wget --continue http://www.libsdl.org/projects/SDL_net/release/SDL_net-1.2.7.tar.gz || { exit 1; }

tar xfvz ./SDL_net-1.2.7.tar.gz || { exit 1; }

cd SDL_net-1.2.7 || { exit 1; }

cat ../patches/SDL_net-1.2.7.patch | patch -p1 || { exit 1; }

#this is seems like a bug in (the version of) PSL1GHT/ps3toolchain
# (that I happen to have installed)
CFLAGS="$CFLAGS -I$PSL1GHT/ppu/include"
export CFLAGS

./configure --prefix="$PS3DEV/portlibs/ppu" --host=ppu \
	--disable-sdltest \
	--with-sdl-exec-prefix="$PS3DEV/portlibs/ppu" \
	--disable-shared \
    	|| { exit 1; }

make && make install || { exit 1; }
