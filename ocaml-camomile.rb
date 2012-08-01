require 'formula'

class OcamlCamomile < Formula
  homepage 'http://camomile.sourceforge.net'
  url 'http://sourceforge.net/projects/camomile/files/camomile/0.8.3/camomile-0.8.3.tar.bz2'
  sha1 '9f2600010820689805b5ab6e4048217ea821d535'

  depends_on 'objective-caml'
  depends_on 'ocaml-findlib'

  # Don't strip symbols, so dynamic linking doesn't break.
  skip_clean :all

  def install
    ENV['OCAMLFIND_DESTDIR'] = lib+'ocaml/site-lib'
    ENV.deparallelize

    (lib+'ocaml/site-lib').mkpath

    system './configure', "--prefix=#{prefix}"
    system 'make'
    system 'make install'
  end
end
