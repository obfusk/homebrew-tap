require 'formula'

class OcamlFindlib < Formula
  homepage 'http://projects.camlcity.org/projects/findlib.html'
  url 'http://download.camlcity.org/download/findlib-1.3.3.tar.gz'
  sha1 '5d1a52b77145348ded29fefe13736694aabb1868'

  depends_on 'objective-caml'

  # Don't strip symbols, so dynamic linking doesn't break.
  skip_clean :all

  def install
    ENV.deparallelize

    inreplace 'findlib.conf.in',
      '@SITELIB@', HOMEBREW_PREFIX+'lib/ocaml/site-lib'

    args = [
      '-bindir', bin,
      '-mandir', man,
      '-sitelib', lib+'ocaml/site-lib',
      '-config', prefix+'etc/findlib.conf',
      '-no-topfind'
    ]

    system './configure', *args
    system 'make all opt'
    system 'make install'

    (lib+'ocaml').install 'src/findlib/topfind'
  end
end
