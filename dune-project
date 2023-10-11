(lang dune 3.7)

(name caravan)

(generate_opam_files true)

(source
 (github mikhaylovilya/caravan))

(authors "Ilya Mikhaylov")

(maintainers "Ilya Mikhaylov")

(license BSD-2-Clause)

; (documentation https://url/to/documentation)

(using menhir 2.1)

(package
 (name caravan)
 (synopsis "Build system for Embox")
 (description "Build system for Embox")
 (depends ocaml dune menhir core core_unix ppx_expect ppx_deriving)
 (tags
  (ocaml embox "build system")))
