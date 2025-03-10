# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QT5_KDEPATCHSET_REV=2
QT5_MODULE="qtbase"
inherit linux-info qt5-build

DESCRIPTION="Cross-platform application development framework"
SLOT=5/${QT5_PV}

if [[ ${QT5_BUILD_TYPE} == release ]]; then
	KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~loong ~ppc ~ppc64 ~riscv ~sparc ~x86"
fi

IUSE="icu old-kernel systemd"

DEPEND="
	dev-libs/double-conversion:=
	dev-libs/glib:2
	dev-libs/libpcre2[pcre16,unicode]
	sys-libs/zlib:=
	icu? ( dev-libs/icu:= )
	!icu? ( virtual/libiconv )
	systemd? ( sys-apps/systemd:= )
"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-hack_never_use_execinfo.patch" )

QT5_TARGET_SUBDIRS=(
	src/tools/bootstrap
	src/tools/moc
	src/tools/rcc
	src/corelib
	src/tools/qlalr
	doc
)

QT5_GENTOO_PRIVATE_CONFIG=(
	!:network
	!:sql
	!:testlib
	!:xml
)

pkg_pretend() {
	use kernel_linux || return
	get_running_version
	if kernel_is -lt 4 11 && ! use old-kernel; then
		ewarn "The running kernel is older than 4.11. USE=old-kernel is needed for"
		ewarn "dev-qt/qtcore to function on this kernel properly. Bugs #669994, #672856"
	fi
}

src_prepare() {
	# don't add -O3 to CXXFLAGS, bug 549140
	sed -i -e '/CONFIG\s*+=/s/optimize_full//' src/corelib/corelib.pro || die

	# fix missing qt_version_tag symbol w/ LTO, bug 674382
	sed -i -e 's/^gcc:ltcg/gcc/' src/corelib/global/global.pri || die

	eapply "${FILESDIR}/${P}-slibtool.patch" # bug 792804, TODO: merge into _QT5_GENTOOPATCHSET_REV

	qt5-build_src_prepare
}

src_configure() {
	local myconf=(
		$(qt_use icu)
		$(qt_use !icu iconv)
		$(qt_use systemd journald)
	)
	use old-kernel && myconf+=(
		-no-feature-renameat2 # needs Linux 3.16, bug 669994
		-no-feature-getentropy # needs Linux 3.17, bug 669994
		-no-feature-statx # needs Linux 4.11, bug 672856
	)
	qt5-build_src_configure
}

src_install() {
	qt5-build_src_install
	qt5_symlink_binary_to_path qmake 5

	local flags=(
		DBUS FREETYPE IMAGEFORMAT_JPEG IMAGEFORMAT_PNG
		OPENGL OPENSSL SSL WIDGETS
	)

	for flag in ${flags[@]}; do
		cat >> "${D}"/${QT5_HEADERDIR}/QtCore/qconfig.h <<- _EOF_ || die

			#if defined(QT_NO_${flag}) && defined(QT_${flag})
			# undef QT_NO_${flag}
			#elif !defined(QT_NO_${flag}) && !defined(QT_${flag})
			# define QT_NO_${flag}
			#endif
		_EOF_
	done
}
