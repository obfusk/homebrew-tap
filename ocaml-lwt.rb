require 'formula'

# TODO: optional dependencies !?

class OcamlLwt < Formula
  homepage 'http://ocsigen.org/lwt/'
  url 'http://ocsigen.org/download/lwt-2.4.0.tar.gz'
  sha1 '036883d33965a8507e1e42bbb0b99bb2441a7b7a'

  depends_on 'objective-caml'
  depends_on 'ocaml-findlib'
  depends_on 'ocaml-react'

  depends_on 'libev'

  # Don't strip symbols, so dynamic linking doesn't break.
  skip_clean :all

  def install
    ENV['OCAMLFIND_DESTDIR'] = lib+'ocaml/site-lib'

    (lib+'ocaml/site-lib').mkpath

    args = %w[ setup.ml -configure --enable-react ] + [
      '--prefix', prefix, '--docdir', doc
    ]

    system 'ocaml', *args
    system 'ocaml setup.ml -build'
    system 'ocaml setup.ml -install'
  end
end
