require 'formula'

class OcamlBatteries < Formula
  homepage 'http://batteries.forge.ocamlcore.org'
  url 'https://forge.ocamlcore.org/frs/download.php/950/batteries-1.5.0.tar.gz'
  sha1 '658a8401676d04f785ab2e98ea1586d5b49d5481'

  depends_on 'objective-caml'
  depends_on 'ocaml-findlib'
  depends_on 'ocaml-camomile'

  # Don't strip symbols, so dynamic linking doesn't break.
  skip_clean :all

  def install
    ENV['BROWSER_COMMAND']    = 'open'   # !?
    ENV['DOCROOT']            = doc
    ENV['OCAMLFIND_DESTDIR']  = lib+'ocaml/site-lib'
    ENV.deparallelize

    (lib+'ocaml/site-lib').mkpath

    system 'make all'
    system 'make install'

    system 'make doc'
    system 'make install-doc'
  end

  def caveats
    <<-EOS.undent
      To get started using Batteries at the toplevel, copy the
      ocamlinit file
        #{HOMEBREW_PREFIX}/lib/ocaml/site-lib/batteries/ocamlinit
      to ~/.ocamlinit.

      If you already have findlib in your ~/.ocamlinit, you only need
      the last line in our ocamlinit to load batteries.

      More usage help available on the wiki:
      https://github.com/ocaml-batteries-team/batteries-included/wiki.
    EOS
  end
end
