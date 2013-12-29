# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
EGIT_REPO_URI="git://git.netfilter.org/${PN}"

inherit autotools git-r3 linux-info

DESCRIPTION="User-space library for low-level interaction with nftables Netlink's API over libmnl"
HOMEPAGE="http://netfilter.org/projects/nftables/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="xml json"

COMMON_DEPEND=">=net-libs/libmnl-1.0.0
		xml? ( >=dev-libs/mini-xml-2.6 )
		json? ( >=dev-libs/jansson-2.3 )"
DEPEND="virtual/pkgconfig
		${COMMON_DEPEND}"
RDEPEND="${COMMON_DEPEND}"

pkg_setup() {
	if kernel_is ge 3 13; then
		CONFIG_CHECK="~NF_TABLES"
		linux-info_pkg_setup
	else
		eerror "This package requires kernel version 3.13 or newer to work properly."
	fi
}

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		$(use_with xml xml-parsing) \
		$(use_with json json-parsing)
}
