# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.0

EAPI=8

CRATES="
	Inflector-0.11.4
	adler-1.0.2
	ahash-0.4.7
	aho-corasick-0.7.18
	aliasable-0.1.3
	ansi_term-0.12.1
	arrayref-0.3.6
	arrayvec-0.7.2
	atty-0.2.14
	autocfg-1.1.0
	bigdecimal-0.3.0
	binary-heap-plus-0.4.1
	bindgen-0.59.2
	bitflags-1.3.2
	blake2b_simd-1.0.0
	blake3-1.3.1
	block-buffer-0.10.2
	bstr-0.2.17
	byte-unit-4.0.14
	bytecount-0.6.2
	byteorder-1.4.3
	cc-1.0.73
	cexpr-0.6.0
	cfg-if-0.1.10
	cfg-if-1.0.0
	chrono-0.4.19
	clang-sys-1.3.2
	clap-2.34.0
	clap-3.1.18
	clap_complete-3.1.4
	clap_lex-0.2.0
	compare-0.1.0
	constant_time_eq-0.1.5
	conv-0.3.3
	coz-0.1.3
	cpp-0.5.7
	cpp_build-0.4.0
	cpp_common-0.4.0
	cpp_common-0.5.7
	cpp_macros-0.5.7
	cpp_syn-0.12.0
	cpp_synmap-0.3.0
	cpp_synom-0.12.0
	cpufeatures-0.2.2
	crc32fast-1.3.2
	crossbeam-channel-0.5.4
	crossbeam-deque-0.8.1
	crossbeam-epoch-0.9.8
	crossbeam-utils-0.8.8
	crossterm-0.23.2
	crossterm_winapi-0.9.0
	crypto-common-0.1.3
	ctor-0.1.22
	ctrlc-3.2.2
	custom_derive-0.1.7
	data-encoding-2.3.2
	data-encoding-macro-0.1.12
	data-encoding-macro-internal-0.1.10
	diff-0.1.12
	digest-0.10.3
	dlv-list-0.2.3
	dns-lookup-1.0.8
	dunce-1.0.2
	either-1.6.1
	env_logger-0.8.4
	env_logger-0.9.0
	exacl-0.8.0
	fastrand-1.7.0
	file_diff-1.0.0
	filetime-0.2.16
	flate2-1.0.23
	fnv-1.0.7
	fs_extra-1.2.0
	fts-sys-0.2.1
	gcd-2.1.0
	generic-array-0.14.5
	getrandom-0.2.6
	glob-0.3.0
	half-1.8.2
	hashbrown-0.9.1
	hashbrown-0.11.2
	heck-0.4.0
	hermit-abi-0.1.19
	hex-0.4.3
	hex-literal-0.3.4
	hostname-0.3.1
	humantime-2.1.0
	indexmap-1.8.1
	instant-0.1.12
	ioctl-sys-0.8.0
	itertools-0.10.3
	itoa-1.0.2
	keccak-0.1.0
	kernel32-sys-0.2.2
	lazy_static-1.4.0
	lazycell-1.3.0
	libc-0.2.126
	libloading-0.7.3
	lock_api-0.4.7
	log-0.4.17
	lscolors-0.10.0
	match_cfg-0.1.0
	md-5-0.10.1
	memchr-1.0.2
	memchr-2.5.0
	memmap2-0.5.3
	memoffset-0.6.5
	minimal-lexical-0.2.1
	miniz_oxide-0.5.1
	mio-0.8.3
	nix-0.24.1
	nom-7.1.1
	num-bigint-0.4.3
	num-integer-0.1.45
	num-traits-0.2.15
	num_cpus-1.13.1
	num_threads-0.1.6
	number_prefix-0.4.0
	numtoa-0.1.0
	once_cell-1.11.0
	onig-6.3.1
	onig_sys-69.7.1
	ordered-multimap-0.3.1
	os_display-0.1.3
	os_str_bytes-6.0.1
	ouroboros-0.15.0
	ouroboros_macro-0.15.0
	output_vt100-0.1.3
	parking_lot-0.12.0
	parking_lot_core-0.9.3
	paste-1.0.7
	peeking_take_while-0.1.2
	phf-0.10.1
	phf_codegen-0.10.0
	phf_generator-0.10.0
	phf_shared-0.10.0
	pkg-config-0.3.25
	platform-info-0.2.0
	ppv-lite86-0.2.16
	pretty_assertions-1.2.1
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.39
	quick-error-2.0.1
	quickcheck-1.0.3
	quote-0.3.15
	quote-1.0.18
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.3
	rayon-1.5.3
	rayon-core-1.9.3
	redox_syscall-0.2.13
	redox_termios-0.1.2
	reference-counted-singleton-0.1.1
	regex-1.5.6
	regex-automata-0.1.10
	regex-syntax-0.6.26
	remove_dir_all-0.5.3
	remove_dir_all-0.7.0
	retain_mut-0.1.7
	rlimit-0.8.3
	rust-ini-0.17.0
	rustc-hash-1.1.0
	rustversion-1.0.6
	same-file-1.0.6
	scopeguard-1.1.0
	selinux-0.2.7
	selinux-sys-0.5.2
	sha1-0.10.1
	sha2-0.10.2
	sha3-0.10.1
	shlex-1.1.0
	signal-hook-0.3.14
	signal-hook-mio-0.2.3
	signal-hook-registry-1.4.0
	siphasher-0.3.10
	smallvec-1.8.0
	smawk-0.3.1
	socket2-0.4.4
	stable_deref_trait-1.2.0
	strsim-0.8.0
	strsim-0.10.0
	strum-0.24.0
	strum_macros-0.24.0
	subtle-2.4.1
	syn-1.0.95
	tempfile-3.3.0
	term_grid-0.1.7
	termcolor-1.1.3
	terminal_size-0.1.17
	termion-1.5.6
	termsize-0.1.6
	textwrap-0.11.0
	textwrap-0.15.0
	thiserror-1.0.31
	thiserror-impl-1.0.31
	time-0.1.44
	time-0.3.9
	time-macros-0.2.4
	typenum-1.15.0
	unicode-ident-1.0.0
	unicode-linebreak-0.1.2
	unicode-segmentation-1.9.0
	unicode-width-0.1.9
	unicode-xid-0.0.4
	unindent-0.1.9
	unix_socket-0.5.0
	users-0.10.0
	utf-8-0.7.6
	utf8-width-0.1.6
	uuid-0.8.2
	vec_map-0.8.2
	version_check-0.9.4
	walkdir-2.3.2
	wasi-0.10.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	which-4.2.5
	wild-2.0.4
	winapi-0.2.8
	winapi-0.3.9
	winapi-build-0.1.1
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.36.1
	windows_aarch64_msvc-0.36.1
	windows_i686_gnu-0.36.1
	windows_i686_msvc-0.36.1
	windows_x86_64_gnu-0.36.1
	windows_x86_64_msvc-0.36.1
	xattr-0.2.3
	z85-3.0.5
	zip-0.6.2
"

inherit cargo

DESCRIPTION="GNU coreutils rewritten in Rust"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/uutils/coreutils"
SRC_URI="https://github.com/uutils/coreutils/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" $(cargo_crate_uris)"
# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 CC0-1.0 ISC MIT Unlicense"
QA_FLAGS_IGNORED=".*"

BDEPEND=">=virtual/rust-1.56.0"

SLOT="0"
KEYWORDS="~amd64"
S="${WORKDIR}/coreutils-${PV}"

src_compile() {
	emake V=1 PROFILE=release
}

src_install() {
	emake V=1 PREFIX="/usr" PROG_PREFIX="uu-" DESTDIR="${D}" MANDIR="/share/man/man1" install
}
