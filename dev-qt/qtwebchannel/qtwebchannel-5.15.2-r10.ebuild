# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KDE_ORG_COMMIT=fa8b07105b5e274daaa8adcc129fa4aa0447f9f7
inherit qt5-build

DESCRIPTION="Qt5 module for integrating C++ and QML applications with HTML/JavaScript clients"

if [[ ${QT5_BUILD_TYPE} == release ]]; then
	KEYWORDS="~ppc ppc64"
fi

IUSE="qml"

DEPEND="
	=dev-qt/qtcore-${QT5_PV}*
	qml? ( =dev-qt/qtdeclarative-${QT5_PV}* )
"
RDEPEND="${DEPEND}"

src_prepare() {
	qt_use_disable_mod qml quick src/src.pro
	qt_use_disable_mod qml qml src/webchannel/webchannel.pro

	qt5-build_src_prepare
}
