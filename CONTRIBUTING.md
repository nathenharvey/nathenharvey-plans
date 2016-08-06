# Contributing

When contributing to the `nathenharvey-plans` repository, follow these
guidelines.

## Package Metadata

Each package plan in this repository *must* contain a value adhering to the
guidelines for each of the following elements:

- `pkg_description`
- `pkg_license` (in [SPDX format](http://spdx.org/licenses/))
- `pkg_maintainer` in the format of "Nathen Harvey <nathen.harvey@gmail.com>"
- `pkg_name` see the section of this document on "Package Name Conventions"
- `pkg_origin` must be set to `nathenharvey`
- `pkg_source`
- `pkg_upstream_url`
- `pkg_version` must be the complete version number of the software

## Package Name Conventions

Each package is identified by a unique string containing four sub-strings
separated by a forward slash (`/`) called a
[PackageIdent](https://www.habitat.sh/docs/concepts-packages/).

    `origin`/`name`/`version`/`release`

The `origin`, `name`, and `version` values of this identifier are user defined
by setting their corresponding variable in your `plan.sh` file while the value
of `release` is generated at build-time.

The value of `name` should exactly match the name of the project it represents
and the `plan.sh` file should be located within a directory of the same name in
this repository.

> Example: The plan for the [bison project](https://www.gnu.org/software/bison/)
project contains setting `pkg_name=bison` and resides in `$root/bison/plan.sh`.

There is one exception to this rule: Additional plans may be defined for
projects for their past major versions by appending the major version number to
its name. The `plan.sh` file for this new package should be located within a
directory of the same name.

> Example: the [bison project](https://www.gnu.org/software/bison/) maintains
the 2.x line along with their current major version (at time of writing: 3.x). A
second plan is created as `bison2` and placed within a directory of the same
name in this repository.

Packages meeting this exception will always have their latest major version
found in the package sharing the exact name of their project. A new package will
be created for the previous major version following these conventions.

> Example: the [bison project](https://www.gnu.org/software/bison/) releases the 4.x line and is continuing to support Bison 3.x. The `bison` package is copied to `bison3` and the `bison` package is updated to build Bison 4.x.

## Building Older Versions

Sometimes you may need a version of software that we are packaging which was
released before the project's corresponding Habitat package was created.

Please *do not* issue a PR containing a new plan for the specific version of
software that you need unless the software project it packages meets the
exceptional cases outlined in the above section "Package Name Conventions".
Instead [create an issue](https://github.com/habitat-sh/core-plans/issues/new)
containing the name and version of the software that you want published to the
public depot. A maintainer will run a one-off build and publish the generated
artifact to the public depot and close your issue once the work is completed.
Issues with an associated gist containing a working fork of our current plan
which builds the version of the software will be attended to first.

## Linting Your Plans

It is good it use a tool to lint your plans to ensure you are not making any
easy-to-catch mistakes in your scripting. We recommend running
[ShellCheck](https://www.shellcheck.net/) against your plans.

Some default checks of ShellCheck can be turned off, since they aren't
necessarily applicable in plans. The following options work well:

```
shellcheck --shell=bash --exclude=SC1090,SC1091,SC2034,SC2039,SC2148,SC2153,SC2154
```

If ShellCheck is installed, you can run this (and other checks) locally with:

```
git add <your changes> && pre-commit run
```

See below for more about the pre-commit hooks.

## Pre-commit hooks

Install [pre-commit](http://pre-commit.com/) to run prior to your commits.
This will perform some initial checks against your changes and recommend any
fixes before you commit.

## Signing Your Commits

This project utilizes a Developer Certificate of Origin (DCO) to ensure that
each commit was written by the author or that the author has the appropriate
rights necessary to contribute the change.  The project utilizes [Developer Certificate of Origin, Version 1.1](http://developercertificate.org/)

```
Developer Certificate of Origin
Version 1.1

Copyright (C) 2004, 2006 The Linux Foundation and its contributors.
660 York Street, Suite 102,
San Francisco, CA 94110 USA

Everyone is permitted to copy and distribute verbatim copies of this
license document, but changing it is not allowed.


Developer's Certificate of Origin 1.1

By making a contribution to this project, I certify that:

(a) The contribution was created in whole or in part by me and I
    have the right to submit it under the open source license
    indicated in the file; or

(b) The contribution is based upon previous work that, to the best
    of my knowledge, is covered under an appropriate open source
    license and I have the right under that license to submit that
    work with modifications, whether created in whole or in part
    by me, under the same open source license (unless I am
    permitted to submit under a different license), as indicated
    in the file; or

(c) The contribution was provided directly to me by some other
    person who certified (a), (b) or (c) and I have not modified
    it.

(d) I understand and agree that this project and the contribution
    are public and that a record of the contribution (including all
    personal information I submit with it, including my sign-off) is
    maintained indefinitely and may be redistributed consistent with
    this project or the open source license(s) involved.
```

Each commit must include a DCO which looks like this

`Signed-off-by: Joe Smith <joe.smith@email.com>`

The project requires that the name used is your real name.  Neither anonymous  
contributors nor those utilizing pseudonyms will be accepted.

Git makes it easy to add this line to your commit messages.

1. Make sure the `user.name` and `user.email` are set in your git configs.
2. Use `-s` or `--signoff` to add the Signed-off-by line to the end of the
commit message.
