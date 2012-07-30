require 'formula'

class Mgit < Formula
  homepage 'https://github.com/obfusk/mgit'
  url 'https://github.com/obfusk/mgit/tarball/v0.1.0'
  sha1 '49d505775e6da6872a707d3e45e3225b4e368200'

  def install
    bin.install 'mgit'
  end
end
