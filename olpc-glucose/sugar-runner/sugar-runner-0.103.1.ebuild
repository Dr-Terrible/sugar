# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
AUTOTOOLS_IN_SOURCE_BUILD=1
AUTOTOOLS_AUTORECONF=1
inherit autotools-utils

DESCRIPTION="Scripts for executing Sugar Framework (Glucose)"
HOMEPAGE="https://github.com/sugarlabs/sugar"
SRC_URI="http://download.sugarlabs.org/sources/sucrose/glucose/${PN}/${P}.tar.xz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="x86 amd64"
IUSE="static-libs"
RESTRICT="mirror"

DOCS=( COPYING README.md )

RDEPEN="dev-libs/glib
	x11-base/xorg-server[kdrive,xvfb,xnest]
	x11-libs/libX11
	x11-libs/libXrandr"

src_configure() {
	econf \
		--disable-dependency-tracking \
		$(use_enable static-libs static) \
		${EXTRA_ECONF}
}