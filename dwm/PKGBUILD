# $Id: PKGBUILD 60970 2011-12-19 21:33:58Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Dag Odenhall <dag.odenhall@gmail.com>
# Contributor: Grigorios Bouzakis <grbzks@gmail.com>

pkgname=dwm
pkgver=6.0
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=('libx11' 'libxinerama')
install=$pkgname.install
source=(http://dl.suckless.org/dwm/dwm-$pkgver.tar.gz
	config.h
	myconfigh.diff
	dwm.desktop
	http://dwm.suckless.org/patches/dwm-6.0-attachabove.diff
	http://dwm.suckless.org/patches/dwm-6.0-float_border_color2.diff
	https://bitbucket.org/jceb81/dwm-patches/raw/90fb0feedff9/focusmaster.patch
	http://dwm.suckless.org/patches/dwm-6.0-moveresize.diff
	http://dwm.suckless.org/patches/dwm-6.0-single_window_no_border.diff
	http://dwm.suckless.org/patches/dwm-6.0-pertag.diff
	http://dwm.suckless.org/patches/dwm-6.0-push.diff
	http://dwm.suckless.org/patches/dwm-6.0-save_floats.diff
	http://dwm.suckless.org/patches/dwm-6.0-statusallmons.diff
	http://dwm.suckless.org/patches/dwm-6.0-swapfocus.diff
	http://dwm.suckless.org/patches/dwm-6.0-tagall.diff
	http://dwm.suckless.org/patches/dwm-6.0-zoomswap.diff
	http://dwm.suckless.org/patches/dwm-6.0-single_tagset.diff
	http://dwm.suckless.org/patches/push.c)
	
build() {
  cd $srcdir/$pkgname-$pkgver
  cp $srcdir/config.h config.h
  sed -i 's/CPPFLAGS =/CPPFLAGS +=/g' config.mk
  sed -i 's/^CFLAGS = -g/#CFLAGS += -g/g' config.mk
  sed -i 's/^#CFLAGS = -std/CFLAGS += -std/g' config.mk
  sed -i 's/^LDFLAGS = -g/#LDFLAGS += -g/g' config.mk
  sed -i 's/^#LDFLAGS = -s/LDFLAGS += -s/g' config.mk
  #patch -p1 -i "$srcdir/${source[5]##*/}"
  #patch -p1 -i "$srcdir/${source[6]##*/}"
  #patch -p1 -i "$srcdir/${source[7]##*/}"
  #patch -p1 -i "$srcdir/${source[8]##*/}"
  #patch -p1 -i "$srcdir/${source[9]##*/}"
  #patch -p1 -i "$srcdir/${source[10]##*/}"
  #patch -p1 -i "$srcdir/${source[12]##*/}"
  #patch -p1 -i "$srcdir/${source[13]##*/}"
  #patch -p1 -i "$srcdir/${source[14]##*/}"
  #patch -p1 -i "$srcdir/${source[15]##*/}"
  patch -p1 -i "$srcdir/${source[16]##*/}"
  sed -i 's/\[EnterNotify/\/\/\[EnterNotify/' $srcdir/$pkgname-$pkgver/$pkgname.c
  sed -i 's/CC\ \=\ cc/CC\ \=\ clang/' $srcdir/$pkgname-$pkgver/config.mk
  cp $startdir/src/push.c $srcdir/$pkgname-$pkgver/push.c
  cd $srcdir/$pkgname-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D README $pkgdir/usr/share/doc/$pkgname/README
  install -m644 -D $srcdir/$pkgname.desktop $pkgdir/usr/share/xsessions/$pkgname.desktop
  cp $srcdir/$pkgname-$pkgver/config.h $srcdir/../
  cp $srcdir/$pkgname-$pkgver/dwm.c $srcdir/../
 }
