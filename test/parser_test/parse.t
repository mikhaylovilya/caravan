  $ cat << EOF > package_imports.my 
  > package lang_test.parser_test
  > import lang_test.includes.*
  > import lang_test.includes2.concrete_tool
  > EOF
  $ dune exec ../../src/parser/parse.exe ./package_imports.my

  $ cat << EOF > package_annotationtype_no_members.my 
  > package lang_test.parser_test
  > annotation ann1 { }
  > EOF
  $ dune exec ../../src/parser/parse.exe ./package_annotationtype_no_members.my

  $ cat << EOF > package_moduletype_no_members.my 
  > package lang_test.parser_test
  > module mod1 { }
  > EOF
  $ dune exec ../../src/parser/parse.exe ./package_moduletype_no_members.my

  $ cat << EOF > package_interfacetype_no_members.my 
  > package lang_test.parser_test
  > interface inter1 { }
  > EOF
  $ dune exec ../../src/parser/parse.exe ./package_interfacetype_no_members.my

  $ cat << EOF > package_entities_with_members.my 
  > package lang_test.parser_test
  > import lang_test.includes.*
  > annotation ann2 
  > {
  >     string str1
  >     number num1 = 7
  >     number num2 = 8.0
  >     number num3 = -1
  >     number hex1 = 0xF1A9
  >     number hex2 = -0xa0
  > }
  > EOF
  $ dune exec ../../src/parser/parse.exe ./package_entities_with_members.my

  $ cat << EOF > string_test.my
  > package lang_test.parser_test
  > module testModule1 {
  >   @ann1 source "\\\\\t\n\r\"\'"
  >   @ann2('''
  > 		AUTHORS
  > 			'Cy'
  > 			''
  > 			\\\\
  > 			\'
  > 			\t\r\n
  > 	''' )
  >   source "*.c"
  > }
  > EOF
  $ dune exec ../../src/parser/parse.exe ./string_test.my

  $ cat << EOF > comment_test.my
  > package lang_test.parser_test
  > module comment_module {
  >   option number num //
  >   // This is singleline comment
  >   depends lang_test.deps
  >   /**/ /* This is singleline comment */
  >   source "*.c"
  >   /* This
  >      is
  >      a
  >      multiline
  >      comment
  >   */
  > }
  > EOF
  $ dune exec ../../src/parser/parse.exe ./comment_test.my