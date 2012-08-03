require 'formula'

# TODO: optional dependencies !?

class JsOfOcaml < Formula
  homepage 'http://ocsigen.org/js_of_ocaml/'
  url 'http://ocsigen.org/download/js_of_ocaml-1.2.tar.gz'
  sha1 '6c2e24acd08d61c9c558b3700242b1717f1e9fbb'

  depends_on 'objective-caml'
  depends_on 'ocaml-findlib'
  depends_on 'ocaml-lwt'

  # Don't strip symbols, so dynamic linking doesn't break.
  skip_clean :all

  def install
    ENV['OCAMLFIND_DESTDIR'] = lib+'ocaml/site-lib'
    ENV.deparallelize

    (lib+'ocaml/site-lib').mkpath

    args = %w[ check_lwt compiler library runtime doc BEST=opt ]

    system 'make', *args
    system 'make', 'install', "BINDIR=#{bin}", 'BEST=opt'

    (doc+'html').mkpath
    (doc+'html').install 'api-html' => 'api'

    doc.install 'examples'
  end
end
