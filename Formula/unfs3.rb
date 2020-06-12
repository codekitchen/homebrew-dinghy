class Unfs3 < Formula
  desc "User-space NFSv3 server"
  homepage "https://unfs3.sourceforge.io"

  # Temporarily using Karl Mikaelsson's branch for nanosecond timestamps
  # on Mac OS High Sierra until such time as he makes an official release.
  # See: https://github.com/codekitchen/dinghy/issues/269#issuecomment-391007703
  url "https://github.com/derfian/unfs3.git", :branch => "higher-resolution-setattr"
  version "0.9.23-pre"
  depends_on "autoconf"
  depends_on "automake"

  # Temporarily keeping 0.9.22 release as 'devel' to ease switching back to test
  head do
    url "https://downloads.sourceforge.net/project/unfs3/unfs3/0.9.22/unfs3-0.9.22.tar.gz"
    sha256 "482222cae541172c155cd5dc9c2199763a6454b0c5c0619102d8143bb19fdf1c"
  end

  head do
    url "http://svn.code.sf.net/p/unfs3/code/trunk/"

    depends_on "autoconf"
    depends_on "automake"
  end

  def install
    ENV.deparallelize # Build is not parallel-safe
    system "./bootstrap"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
