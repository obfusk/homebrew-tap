require 'formula'

class Mgit < Formula
  homepage 'https://github.com/obfusk/mgit'
  url 'https://github.com/obfusk/mgit/tarball/v0.1.1'
  sha1 'd7c0f58f4c14672fe18667741c90405e089099af'

  def install
    bin.install 'mgit'
  end
end
