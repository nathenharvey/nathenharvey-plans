# Plan Repository - https://github.com/nathenharvey/nathenharvey-plans
pkg_origin=nathenharvey
pkg_name=etherpad-lite
pkg_version=1.6.0
pkg_maintainer="Nathen Harvey <nharvey@chef.io>"
pkg_license=('Apache-2.0')
pkg_source=https://github.com/ether/${pkg_name}/archive/${pkg_version}.zip
pkg_shasum="d0635f2904f0c06295bde9d37ec950329cea319ae2dc7d2fdedcb1a281dbbad8"
pkg_build_deps=(core/curl)
pkg_deps=(core/node)
pkg_expose=(9001)

do_build() {
  return 0
}

do_install() {
  ./bin/installDeps.sh
  cp -vr ./* ${pkg_prefix}
}
