# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Linode Longview"
HOMEPAGE="https://www.linode.com/longview/"
LICENSE="Artistic GPL-2"
MY_PN="${PN/linode-/}"
SRC_URI="https://github.com/linode/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="
	app-portage/eix
	dev-perl/IO-Socket-INET6
	dev-perl/JSON
	dev-perl/Log-LogLite
	dev-perl/libwww-perl[ssl]
	dev-perl/Linux-Distribution
	dev-perl/Try-Tiny
"

MY_P="${P/linode-/}"
S="${WORKDIR}/${MY_P}"

src_install(){
	dodir /opt/linode/longview
	cp -r Linode "${D}"/opt/linode/longview
	keepdir /etc/linode
	newinitd "${FILESDIR}"/longview.openrc longview
}

pkg_postinst(){
	elog "You should now start Longview and enter the API Key provided by the Linode Manager."
	elog "You can do so with the following command:"
	elog
	elog "/etc/init.d/longview start"
	elog
	elog "You'll also want to add Longview to the default runlevel:"
	elog
	elog "rc-update add longview default"
	elog
	elog "If you have any questions about using Longview, please open a support"
	elog "ticket from within the Linode Manager."
}
