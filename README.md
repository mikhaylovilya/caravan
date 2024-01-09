[![Build master](https://github.com/mikhaylovilya/caravan/actions/workflows/master.yml/badge.svg?branch=master)](https://github.com/mikhaylovilya/caravan/actions/workflows/master.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# caravan
Build system for Embox

# How to build
```sh
$ opam install . --deps-only --with-test
$ opam exec -- dune build
```

# How to use
caravan provides two command line interfaces: src/compiler.exe and src/parser/parser.exe

## compiler
```sh
$ ./_build/default/src/compiler.exe --help           # for help
$ ./_build/default/src/compiler.exe <filename>       # compile one source file (WIP)
$ ./_build/default/src/compiler.exe <path> -dir      # scan directory for source files and compile as single project (WIP)
```
## parser
```sh
$ ./_build/default/src/parser/parser.exe <filename>  # parse source file and print AST to stdout
```