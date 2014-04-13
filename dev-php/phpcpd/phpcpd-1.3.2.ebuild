# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PEAR_PV="1.3.2"
PHP_PEAR_PKG_NAME="phpcpd"

inherit php-pear-r1

DESCRIPTION="Copy/Paste Detector (CPD) for PHP code"
HOMEPAGE="http://pear.phpunit.de"
SRC_URI="http://pear.phpunit.de/get/phpcpd-${PEAR_PV}.tgz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
HOMEPAGE="http://www.phpunit.de"

RDEPEND="${RDEPEND}
	>=dev-php/ezc-ConsoleTools-1.6
	>=dev-php/File_Iterator-1.1.0
	dev-php/PHP_Timer"
