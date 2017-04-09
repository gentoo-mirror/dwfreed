# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=CHORNY
MODULE_VERSION=0.23
inherit perl-module

DESCRIPTION="Detect on which Linux distribution we are running"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-perl/Module-Build"
RDEPEND=""

SRC_TEST=do
