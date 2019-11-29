# This file is part of Plan10. It is subject to the license terms in
# the LICENSE file found in the top-level directory of this
# distribution.
# This file may not be copied, modified, propagated, or distributed
# except according to the terms contained in the LICENSE file.
#
# Maintainer: Plan10-install-themes templates <eric@obarun.org>
# DO NOT EDIT this PKGBUILD if you don't know what you do

pkgname=plan10-install-themes
pkgver=23536df
pkgrel=1
pkgdesc="Templates for automatic installation by obarun-install"
arch=(x86_64)
url="file:///var/lib/plan10/$pkgname/update_package/$pkgname"
license=(ISC)
depends=(plan10-install)
#install=
source=("$pkgname::git+file:///var/lib/plan10/$pkgname/update_package/$pkgname")
md5sums=(SKIP)

pkgver() {
	cd "${pkgname}"
	
	git describe --tags | sed -e 's:-:+:g;s:^v::'
}

package() {
	cd "${pkgname}"

	make DESTDIR="$pkgdir" install
}
