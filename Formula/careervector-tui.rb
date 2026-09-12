# Generated from verified upstream archives; no product compilation.
require "os/linux/glibc"

class CareervectorTui < Formula
  desc "CareerVector terminal workspace with its controlled terminal"
  homepage "https://careervector.corbet.ch"
  version "0.1.0-alpha.10"
  license "BUSL-1.1"
  revision 0
  depends_on :linux
  depends_on "patchelf" => :build
  depends_on "gtk4"
  depends_on "libadwaita"
  depends_on "openssl@3"
  depends_on arch: :x86_64

  on_intel do
    url "https://github.com/julian-corbet/careervector-releases/releases/download/tui-v0.1.0-alpha.10/careervector-0.1.0-alpha.10-linux-x86_64.tar.gz"
    sha256 "530c116b294840c090e03cc803e57200c3ef9385230d48d03936c770d3d0c74a"
  end

  def install
    libexec.install Dir["*", ".[^.]*"]
    paths = dependencies.reject { |dep| dep.name == "patchelf" }.flat_map do |dep|
      formula = dep.to_formula
      [formula.opt_lib.to_s, *formula.runtime_formula_dependencies.map { |runtime| runtime.opt_lib.to_s }]
    end
    rpath = paths.uniq.join(":")
    odie "This release requires system glibc 2.39 or newer" if OS::Linux::Glibc.system_version < Version.new("2.39")
    ["bin/careervector", "bin/careervector-tui", "bin/cterm", "bin/ctermd"].each do |binary|
      system Formula["patchelf"].opt_bin/"patchelf", "--set-rpath", rpath, libexec/binary
    end
    (bin/"careervector").write_env_script libexec/"bin/careervector", XDG_DATA_DIRS: dependencies.map { |dep| dep.to_formula.opt_share.to_s }.join(":") + ":/usr/local/share:/usr/share"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/careervector --version")
  end
end
