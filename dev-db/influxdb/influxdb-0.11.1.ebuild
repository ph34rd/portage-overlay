# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit unpacker user systemd

DESCRIPTION="Scalable datastore for metrics, events, and real-time analytics"
HOMEPAGE="http://influxdb.com"
SRC_URI="https://s3.amazonaws.com/influxdb/${PN}_${PV}-1_amd64.deb"
RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
        mkdir -p ${WORKDIR}/${P}
        cd ${WORKDIR}/${P}
    unpack_deb ${A}
}

pkg_setup() {
        ebegin "Creating influxdb user and group"
        enewgroup ${PN}
        enewuser ${PN} -1 -1 "/var/lib/influxdb" ${PN}
        eend $?
}

src_install() {
        cp -Rp * "${D}"

        newinitd "${FILESDIR}/${PN}.initd" influxdb
        systemd_newunit usr/lib/influxdb/scripts/influxdb.service influxdb.service

        fowners ${PN}:${PN} /var/lib/influxdb
        keepdir /var/log/influxdb
        fperms 0700 /var/log/influxdb
        fowners ${PN}:${PN} /var/log/influxdb
}
