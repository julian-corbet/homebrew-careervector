# Generated from verified upstream archives; no product compilation.
require "os/linux/glibc"

class Careervector < Formula
  desc "CareerVector desktop workspace"
  homepage "https://careervector.corbet.ch"
  version "0.0.1"
  license "BUSL-1.1"
  revision 0
  depends_on :linux
  depends_on "patchelf" => :build
  depends_on "gtk+3"
  depends_on "webkitgtk"
  depends_on "glib"
  depends_on "cairo"
  depends_on "gdk-pixbuf"
  depends_on "dbus"
  depends_on arch: :x86_64

  on_intel do
    url "https://github.com/julian-corbet/careervector-releases/releases/download/desktop-v0.0.1/careervector-0.0.1-linux-x86_64.tar.gz"
    sha256 "88b85252e406912a9c382ce6d245e46c669167d1547aa1bc8efea57aa8ad5cec"
  end

  def install
    libexec.install Dir["*", ".[^.]*"]
    paths = dependencies.reject { |dep| dep.name == "patchelf" }.flat_map do |dep|
      formula = dep.to_formula
      [formula.opt_lib.to_s, *formula.runtime_formula_dependencies.map { |runtime| runtime.opt_lib.to_s }]
    end
    rpath = paths.uniq.join(":")
    odie "This release requires system glibc 2.39 or newer" if OS::Linux::Glibc.system_version < Version.new("2.39")
    ["careervector"].each do |binary|
      system Formula["patchelf"].opt_bin/"patchelf", "--set-rpath", rpath, libexec/binary
    end
    desktop = (libexec/"share/applications/ch.corbet.careervector.desktop").read
    desktop = desktop.gsub("/usr/lib/careervector/careervector", (libexec/"careervector").to_s)
    (share/"applications").mkpath
    (share/"applications/ch.corbet.careervector.desktop").write desktop
    (share/"icons/hicolor/256x256/apps").install libexec/"share/icons/hicolor/256x256/apps/ch.corbet.careervector.png"
  end

  test do
    assert_match version.to_s, shell_output("#{libexec}/careervector --version")
  end
end
