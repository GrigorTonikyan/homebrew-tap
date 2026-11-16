class Cddm < Formula
  desc "Polyglot Code De-Duplication Meister & Autonomous Refactoring Engine"
  homepage "https://git.gt-web-dev.com/gt-dev/cddm"
  version "4.10.0"
  license "MIT"

  on_linux do
    on_intel do
      url "https://git.gt-web-dev.com/gt-dev/cddm/releases/download/v#{version}/cddm-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e091dcc254ccc1a8100d3af1bb58edb591b8fedb711e7d2aa41b8e52625e4cc"
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
