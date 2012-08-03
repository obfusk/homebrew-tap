require 'formula'

class OcamlReact < Formula
  homepage 'http://erratique.ch/software/react'
  url 'http://erratique.ch/software/react/releases/react-0.9.3.tbz'
  sha1 '949fbf9df877371b8a968d590aa88f43efa05eec'

  depends_on 'objective-caml'
  depends_on 'ocaml-findlib'

  # Don't strip symbols, so dynamic linking doesn't break.
  skip_clean :all

  def install
    ENV['OCAMLFIND_DESTDIR'] = lib+'ocaml/site-lib'

    (lib+'ocaml/site-lib').mkpath

    system 'ocaml setup.ml -configure'
    system 'ocaml setup.ml -build'
    system 'ocaml setup.ml -install'
  end
end
