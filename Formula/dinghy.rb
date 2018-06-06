class Dinghy < Formula
  desc "faster, friendlier Docker on OS X"
  homepage "https://github.com/codekitchen/dinghy"
  url "https://github.com/codekitchen/dinghy.git", :tag => "v4.6.4", :revision => "bed8ce2a85168f972e3576a3b8f7fb3a934ca94b"
  head "https://github.com/codekitchen/dinghy.git", :branch => :master

  # Dinghy version hasn't changed, but unfs3 dependency has
  revision 1

  depends_on "codekitchen/dinghy/unfs3"

  def install
    if head?
      inreplace "cli/dinghy/version.rb", /DINGHY_VERSION=.*/, "DINGHY_VERSION='#{version}'"
    end
    bin.install "bin/dinghy"
    bin.install "bin/_dinghy_command"
    prefix.install "cli"
  end

  def caveats; <<~EOS
    Run `dinghy create` to create the VM, then `dinghy up` to bring up the VM and services.
    EOS
  end

  test do
    system "dinghy", "version"
  end
end
