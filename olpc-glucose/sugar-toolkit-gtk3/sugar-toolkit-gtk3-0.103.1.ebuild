# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )
AUTOTOOLS_IN_SOURCE_BUILD=1
AUTOTOOLS_AUTORECONF=1
inherit python-r1 autotools-utils

DESCRIPTION="GTK3 library for Sugar Framework (Glucose)"
HOMEPAGE="https://github.com/sugarlabs/sugar"
SRC_URI="http://download.sugarlabs.org/sources/sucrose/glucose/${PN}/${P}.tar.xz"
LICENSE="LGPL-2.1"

SLOT="0"
KEYWORDS="x86 amd64"
IUSE="static-libs nls"
RESTRICT="mirror"

DOCS=( AUTHORS COPYING README )

DEPEND="x11-libs/gtk+:3
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXfixes
	x11-libs/libXi
	media-libs/alsa-lib"
RDEPEND="${DEPEND}"

src_configure() {
	econf $(use_enable static-libs static) \
		$(use_enable nls) \
		${EXTRA_ECONF}
}