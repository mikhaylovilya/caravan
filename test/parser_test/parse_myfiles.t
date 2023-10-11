$ for file in ./myfiles/*.my; do dune exec ../../src/parser/parse.exe $file; done | grep 'Syntax error'
$ dune exec ../../src/parser/parse.exe ./myfiles/Arp.my
