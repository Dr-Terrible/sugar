# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )
AUTOTOOLS_IN_SOURCE_BUILD=1
AUTOTOOLS_AUTORECONF=1
inherit autotools-utils python-r1

DESCRIPTION="GTK shell for Sugar Framework (Glucose)"
HOMEPAGE="https://github.com/sugarlabs/sugar"
SRC_URI="http://download.sugarlabs.org/sources/sucrose/glucose/${PN}/${P}.tar.xz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="x86 amd64"
IUSE="nls"
RESTRICT="mirror"

DOCS=( AUTHORS COPYING )

pkg_setup() {
	python_setup
}

# from version 0.102 gconf is deprecated
src_configure() {
	econf \
		--disable-dependency-tracking \
		--disable-schemas-install \
		--disable-update-mimedb \
		$(use_enable nls) \
		${EXTRA_ECONF}
}