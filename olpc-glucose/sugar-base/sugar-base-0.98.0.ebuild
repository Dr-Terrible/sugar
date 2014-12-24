# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )
AUTOTOOLS_IN_SOURCE_BUILD=1
AUTOTOOLS_AUTORECONF=1
inherit autotools-utils python-r1

DESCRIPTION="Core component for Sugar Framework (Glucose)"
HOMEPAGE="http://sugarlabs.org"
SRC_URI="http://download.sugarlabs.org/sources/sucrose/glucose/${PN}/${P}.tar.bz2"
LICENSE="LGPL-2.1"

SLOT="0"
KEYWORDS="x86 amd64"
IUSE="static-libs nls"
RESTRICT="mirror"

DOCS=( COPYING NEWS )

pkg_setup() {
	python_setup
}
src_configure() {
	econf $(use_enable static-libs static) \
		$(use_enable nls) \
		${EXTRA_ECONF}
}