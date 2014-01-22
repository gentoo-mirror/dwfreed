# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools linux-info

DESCRIPTION="Linux kernel (3.13+) firewall, NAT and packet mangling tools"
HOMEPAGE="http://netfilter.org/projects/nftables/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"
SRC_URI="http://netfilter.org/projects/${PN}/files/${P}.tar.bz2"

COMMON_DEPEND="net-libs/libmnl
		>=net-libs/libnftnl-1.0.0-r2
		dev-libs/gmp
		sys-libs/readline"
# Upstream checks specifically for bison
DEPEND="sys-devel/bison
		sys-devel/flex
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
	epatch "${FILESDIR}"/nftables-0.099-94300c7.patch
	eautoreconf
}

src_configure() {
	econf \
		--sbindir="${EPREFIX}"/sbin \
		$(use_enable debug)
}

src_install() {
	default
	doman "${FILESDIR}"/nftables.8
}
