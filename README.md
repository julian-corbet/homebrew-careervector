# CareerVector Homebrew tap

Experimental Linux x86-64 binary formulas. The TUI installs the `careervector` terminal command; the desktop uses a private executable and application-menu entry.

```sh
brew tap corbet-labs/careervector https://github.com/julian-corbet/homebrew-careervector
brew install corbet-labs/careervector/careervector
brew install corbet-labs/careervector/careervector-tui
```

Requires system GLIBC 2.39 or newer. The formulas install verified release archives and Homebrew GUI dependencies, with no application compilation. Native macOS packages are not available yet.

Formula Ruby syntax and the underlying native archives passed CI. Actual `brew install` / `brew test` remains unverified; the current Homebrew toolchain needs a newer Ruby than the provisioned test worker. Arch and CachyOS users should prefer the native AUR packages.

[Releases, checksums, licenses and relinking materials](https://github.com/julian-corbet/careervector-releases/releases)
