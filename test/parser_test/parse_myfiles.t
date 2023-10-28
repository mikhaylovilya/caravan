  $ for file in ./myfiles/*.my; do dune exec ../../src/parser/parse.exe $file; done | grep 'Syntax error'
  [1]
$ dune exec ../../src/parser/parse.exe ./myfiles/Arp.my
