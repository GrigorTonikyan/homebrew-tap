class Cddm < Formula
  desc "Polyglot Code De-Duplication Meister & Autonomous Refactoring Engine"
  homepage "https://git.gt-web-dev.com/gt-dev/cddm"
  version "4.14.0"
  license "MIT OR Apache-2.0"

  on_linux do
    on_intel do
      url "https://git.gt-web-dev.com/gt-dev/cddm/releases/download/v#{version}/cddm-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b8d55f68d3572fed186f5795c336f9068c12ba123c91813404fae99e5cf0e49"
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
