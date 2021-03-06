# cre2

[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/939/badge)](https://bestpractices.coreinfrastructure.org/projects/939)
[![Build Status](https://travis-ci.org/marcomaggi/cre2.svg?branch=master)](https://travis-ci.org/marcomaggi/cre2)
[![Coverity passed](https://scan.coverity.com/projects/12593/badge.svg)](https://scan.coverity.com/projects/marcomaggi-cre2)
[![codecov](https://codecov.io/gh/marcomaggi/cre2/branch/master/graph/badge.svg)](https://codecov.io/gh/marcomaggi/cre2)


## Introduction

The CRE2 distribution is a C language wrapper for the RE2 library, which
is implemented in C++.  RE2 is a fast, safe, thread-friendly alternative
to  backtracking regular  expression engines  like those  used in  PCRE,
Perl, and Python.

  This distribution makes  use of the GNU Autotools.  The  last time the
maintainer updated  this paragraph,  he had tested  this package  with a
checkout of re2 on Apr 11, 2017.


## License

Copyright (c) 2012, 2013, 2015-2017 Marco Maggi <marco.maggi-ipsu@poste.it><br/>
Copyright (c) 2011 Keegan McAllister<br/>
All rights reserved.

Redistribution  and use  in source  and  binary forms,  with or  without
modification, are  permitted provided that the  following conditions are
met:

1.  Redistributions  of source  code  must  retain the  above  copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions  in binary  form must  reproduce the  above copyright
   notice, this list  of conditions and the following  disclaimer in the
   documentation and/or other materials provided with the distribution.

3. Neither the name of the author  nor the names of his contributors may
   be used  to endorse  or promote products  derived from  this software
   without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS
IS'' AND ANY  EXPRESS OR IMPLIED WARRANTIES, INCLUDING,  BUT NOT LIMITED
TO,  THE  IMPLIED  WARRANTIES  OF  MERCHANTABILITY  AND  FITNESS  FOR  A
PARTICULAR PURPOSE  ARE DISCLAIMED.   IN NO EVENT  SHALL THE  AUTHORS OR
CONTRIBUTORS BE  LIABLE FOR  ANY DIRECT, INDIRECT,  INCIDENTAL, SPECIAL,
EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT LIMITED  TO,
PROCUREMENT  OF SUBSTITUTE  GOODS OR  SERVICES;  LOSS OF  USE, DATA,  OR
PROFITS; OR BUSINESS  INTERRUPTION) HOWEVER CAUSED AND ON  ANY THEORY OF
LIABILITY,  WHETHER IN  CONTRACT, STRICT  LIABILITY, OR  TORT (INCLUDING
NEGLIGENCE  OR OTHERWISE)  ARISING IN  ANY WAY  OUT OF  THE USE  OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


## Install

To install from a proper release tarball, do this:

```
$ cd cre2-0.1.0
$ mkdir build
$ cd build
$ ../configure
$ make
$ make check
$ make install
```

to inspect the available configuration options:

```
$ ../configure --help
```

The Makefile is designed to allow parallel builds, so we can do:

```
$ make -j4 all && make -j4 check
```

which,  on  a  4-core  CPU,   should  speed  up  building  and  checking
significantly.

The Makefile supports the DESTDIR  environment variable to install files
in a temporary location, example: to see what will happen:

```
$ make -n install DESTDIR=/tmp/cre2
```

to really do it:

```
$ make install DESTDIR=/tmp/cre2
```

After the  installation it is  possible to verify the  installed library
against the test suite with:

```
$ make installcheck
```

From a repository checkout or snapshot  (the ones from the Github site):
we  must install  the GNU  Autotools  (GNU Automake,  GNU Autoconf,  GNU
Libtool), then  we must first run  the script "autogen.sh" from  the top
source directory, to generate the needed files:

```
$ cd cre2
$ sh autogen.sh

```

notice  that  `autogen.sh`  will   run  the  programs  `autoreconf`  and
`libtoolize`; the  latter is  selected through the  environment variable
`LIBTOOLIZE`,  whose  value  can  be  customised;  for  example  to  run
`glibtoolize` rather than `libtoolize` we do:

```
$ LIBTOOLIZE=glibtoolize sh autogen.sh
```

After this  the procedure  is the same  as the one  for building  from a
proper release tarball, but we have to enable maintainer mode:

```
$ ../configure --enable-maintainer-mode [options]
$ make
$ make check
$ make install
```

## Usage

Read the documentation.


## Credits

RE2 is  a Google project.  CRE2  is based on code  by Keegan McAllister.
This distribution was assembled by Marco Maggi.

  Matthew  Hall (https://github.com/megahall)  contributed miscellaneous
fixes.

  Maksym  Melnychok (https://github.com/keymone)  contributed a  fix for
wrong usage of variable-length arrays.

  afiaux    (https://github.com/afiaux)   contributed    the   RE2:Set()
interface.

  Guillaume Mass�  (https://github.com/MasseGuillaume) contributed fixes
and the implementation of `cre2_find_named_capturing_groups()`.


## Bugs, vulnerabilities and contributions

Bug  and vulnerability  reports are  appreciated, all  the vulnerability
reports are public; register them at  the Issue Tracker at the project's
Github site.  For contributions and patches please use the Pull Requests
feature at the project's Github site.


## Resources

The latest release of this package can be downloaded from:

[https://bitbucket.org/marcomaggi/cre2/downloads](https://bitbucket.org/marcomaggi/cre2/downloads)

development takes place at:

[http://github.com/marcomaggi/cre2/](http://github.com/marcomaggi/cre2/)

and as backup at:

[https://bitbucket.org/marcomaggi/cre2/](https://bitbucket.org/marcomaggi/cre2/)

the documentation is available online:

[http://marcomaggi.github.io/docs/cre2.html](http://marcomaggi.github.io/docs/cre2.html)

the GNU Project software can be found here:

[http://www.gnu.org/](http://www.gnu.org/)


## Badges and static analysis

### CII Best Practices

The  Linux  Foundation's  Core   Infrastructure  Initiative  (CII)  Best
Practices badge is a way for Free/Libre and Open Source Software (FLOSS)
projects to show that they follow  best practices.  We can find the self
certification at:

[https://bestpractices.coreinfrastructure.org/projects/939/](https://bestpractices.coreinfrastructure.org/projects/939/)


### Travis CI

Travis CI is  a hosted, distributed continuous  integration service used
to build and test software projects  hosted at GitHub.  We can find this
project's dashboard at:

[https://travis-ci.org/marcomaggi/cre2](https://travis-ci.org/marcomaggi/cre2)

Usage of this  service is configured through the  file `.travis.yml` and
the scripts under the directory `meta/travis-ci`.


### Coverity Scan

Coverity Scan is  a service providing the results of  static analysis on
open source coding projects.  We can find this project's dashboard at:

[https://scan.coverity.com/projects/marcomaggi-cre2](https://scan.coverity.com/projects/marcomaggi-cre2)

Usage of this  service is implemented with make rules;  see the relevant
section in the file `Makefile.am`.  To access the service a unique token
is needed: this token is private and is owned by the current maintainer.


### Clang's Static Analyzer

The Clang Static Analyzer is a source code analysis tool that finds bugs
in C, C++, and Objective-C programs.  It is distributed along with Clang
and we can find it at:

[http://clang-analyzer.llvm.org/](http://clang-analyzer.llvm.org/)

Usage of this  service is implemented with make rules;  see the relevant
section in the file `Makefile.am`.


### Codecov

Codecov is a service providing code  coverage reports.  We can find this
project's dashboard at:

[https://codecov.io/gh/marcomaggi/cre2](https://codecov.io/gh/marcomaggi/cre2)

Usage of  this service is  implemented through direct  interface between
GitHub and Codecov  sites; it configured through  the file `codecov.yml`
and appropriate entries in Travis CI's matrix of builds.

