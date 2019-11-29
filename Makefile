# Makefile for plan10-install-themes

VERSION = $$(git describe --tags| sed 's/-.*//g;s/^v//;')
PKGNAME = plan10-install-themes

BINDIR = /usr/bin

FILES = $$(find -mindepth 2 -type f -name "customizeChroot")
DIRS = 	jwm \
		minimal \
		openbox \
		plasma \
		xfce4
			
install:
	
	for i in $(FILES); do \
		sed -i 's,@BINDIR@,$(BINDIR),' $$i; \
	done
	for i in $(DIRS); do \
		install -Dm755 $$i/customizeChroot $(DESTDIR)/var/lib/plan10/plan10-install/config/$$i/customizeChroot; \
		install -Dm644 $$i/pacman.conf $(DESTDIR)/var/lib/plan10/plan10-install/config/$$i/pacman.conf; \
		for k in $$i/package_list/*; do \
			install -Dm644 $$k $(DESTDIR)/var/lib/plan10/plan10-install/config/$$k; \
		done; \
		cp -aT $$i/rootfs $(DESTDIR)/var/lib/plan10/plan10-install/config/$$i/rootfs; \
	done	
			
	install -Dm644 PKGBUILD $(DESTDIR)/var/lib/plan10/plan10-install-themes/update_package/PKGBUILD
	
	install -Dm644 LICENSE $(DESTDIR)/usr/share/licenses/$(PKGNAME)/LICENSE
version:
	@echo $(VERSION)
	
.PHONY: install version
