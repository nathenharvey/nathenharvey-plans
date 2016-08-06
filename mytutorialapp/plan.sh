# Plan Repository - https://github.com/nathenharvey/nathenharvey-plans
pkg_origin=nathenharvey
pkg_name=mytutorialapp
pkg_version=0.1.0
pkg_maintainer="Nathen Harvey <nharvey@chef.io>"
pkg_license=('Apache-2.0')
pkg_source=https://s3-us-west-2.amazonaws.com/${pkg_name}/${pkg_name}-${pkg_version}.tar.gz
pkg_shasum=b54f8ada292b0249245385996221751f571e170162e0d464a26b958478cc9bfa
pkg_filename=${pkg_name}-${pkg_version}.tar.gz
pkg_deps=(core/node)
pkg_expose=(8080)
