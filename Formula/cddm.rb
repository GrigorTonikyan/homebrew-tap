class Cddm < Formula
  desc "Polyglot Code De-Duplication Meister & Autonomous Refactoring Engine"
  homepage "https://git.gt-web-dev.com/gt-dev/cddm"
  version "4.13.0"
  license "MIT OR Apache-2.0"

  on_linux do
    on_intel do
      url "https://git.gt-web-dev.com/gt-dev/cddm/releases/download/v#{version}/cddm-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd6d3ba26d379b8b2bed16cafb1f7ec867e1c63961860df37c2ffd7ed8a160a2"
    end
  end

  def install
    bin.install "cddm"
    bin.install "cddm-mcp" if File.exist?("cddm-mcp")
    bin.install "cddm-lsp" if File.exist?("cddm-lsp")

    generate_completions_from_executable(bin/"cddm", "completions")
  end

  test do
    assert_match "cddm", shell_output("#{bin}/cddm --version")
  end
end
