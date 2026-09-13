# CareerVector Homebrew tap

Linux x86-64 binary formulas. The TUI installs the `careervector` terminal command; the desktop uses a private executable and application-menu entry.

```sh
brew tap corbet-labs/careervector https://github.com/julian-corbet/homebrew-careervector
brew install corbet-labs/careervector/careervector
brew install corbet-labs/careervector/careervector-tui
```

Requires system GLIBC 2.39 or newer. The formulas install verified release archives and Homebrew GUI dependencies, with no application compilation. Native macOS packages are not available yet.

Both formulas passed real `brew install`, `brew test`, runtime linkage and coinstallation checks with Homebrew 6.0.22 on Linux x86-64. All 191 product runtime dependencies were poured from bottles; no CareerVector native product was rebuilt. Arch and CachyOS users should prefer the native AUR packages.

[Installation evidence](https://github.com/julian-corbet/careervector-releases/blob/main/verification/homebrew-linux-x86_64.json) records the exact tap and runtime inputs. The isolated proot check disabled Homebrew Landlock after a fixture-specific execution denial and successfully replayed every affected setup hook. Normal Homebrew sandbox behavior and GUI interaction were not tested. The separate Homebrew test harness compiled the Prism Ruby extension; [test runtime provenance](https://github.com/julian-corbet/careervector-releases/blob/main/verification/homebrew-test-runtime.json) records that work.

[Releases, checksums, licenses and relinking materials](https://github.com/julian-corbet/careervector-releases/releases)
