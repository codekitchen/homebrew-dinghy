class Dinghy < Formula
  desc "faster, friendlier Docker on OS X"
  homepage "https://github.com/codekitchen/dinghy"
  url "https://github.com/codekitchen/dinghy.git", :tag => "v4.6.0", :revision => "74d9815b60a9901b5836208626558f0248441bda"
  head "https://github.com/codekitchen/dinghy.git", :branch => :master

  depends_on "codekitchen/dinghy/unfs3"

  def install
    if head?
      inreplace "cli/dinghy/version.rb", /DINGHY_VERSION=.*/, "DINGHY_VERSION='#{version}'"
    end
    bin.install "bin/dinghy"
    bin.install "bin/_dinghy_command"
    prefix.install "cli"
  end

  def caveats; <<-EOS.undent
    Run `dinghy create` to create the VM, then `dinghy up` to bring up the VM and services.
    EOS
  end

  test do
    system "dinghy", "version"
  end
end
