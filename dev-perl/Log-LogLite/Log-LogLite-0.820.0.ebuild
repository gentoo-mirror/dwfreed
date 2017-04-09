# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=RANI
MODULE_VERSION=0.82
inherit perl-module

DESCRIPTION="The Log::LogLite class helps us create simple logs for our application."

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=dev-perl/IO-LockedFile-0.210.0"

SRC_TEST=do
