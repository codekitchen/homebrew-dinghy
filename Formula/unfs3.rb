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
