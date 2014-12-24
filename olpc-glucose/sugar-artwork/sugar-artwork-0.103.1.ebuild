# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
AUTOTOOLS_IN_SOURCE_BUILD=1
AUTOTOOLS_AUTORECONF=1
inherit autotools-utils

DESCRIPTION="Icons and themes for Sugar Framework (Glucose)"
HOMEPAGE="https://github.com/sugarlabs/sugar"
SRC_URI="http://download.sugarlabs.org/sources/sucrose/glucose/${PN}/${P}.tar.xz"
LICENSE="LGPL-2.1"

SLOT="0"
KEYWORDS="x86 amd64"
IUSE="static-libs"
RESTRICT="mirror"

DOCS=( AUTHORS ChangeLog COPYING NEWS README )

COMMON_DEPEND="x11-libs/gtk+:3
	x11-libs/cairo[glib]
	dev-libs/atk
	x11-libs/gdk-pixbuf
	x11-libs/pango"
DEPEND="${COMMON_DEPEND}
	media-gfx/icon-slicer"
RDEPEND="${COMMON_DEPEND}
	x11-misc/icon-naming-utils"

src_configure() {
	econf \
		--disable-dependency-tracking \
		$(use_enable static-libs static) \
		${EXTRA_ECONF}
}