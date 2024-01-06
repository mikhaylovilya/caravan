  $ for file in ./myfiles/*.my; do dune exec ../../src/parser/parse.exe $file; done | grep 'Syntax error'
  [1]
$ ../../src/compiler.exe /home/cy/Desktop/ocaml-rep/embox -dir -v | grep 'Syntax error'
$ dune exec ../../src/parser/parse.exe ./myfiles/Arp.my
