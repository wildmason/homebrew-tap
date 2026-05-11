class SafeBundle < Formula
  desc "Local-first redaction and safe support bundle CLI"
  homepage "https://github.com/wildmason/safe-bundle"
  version "1.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wildmason/safe-bundle/releases/download/v1.1.0/safe-bundle-v1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "0b4dfd5b39f90aaabd661539eb98cb63475ca7f7e83c201bb47fdbefab7d9e62"
    else
      url "https://github.com/wildmason/safe-bundle/releases/download/v1.1.0/safe-bundle-v1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "ccc9be8976d08c65f243d149354f8f8d9e0b6cefd027d2ba2268a1850d7025e0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wildmason/safe-bundle/releases/download/v1.1.0/safe-bundle-v1.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a202279ff7ab777556126fc0bd31a7e480008bf1145f8c71a97756c4206b763b"
    end
  end

  def install
    bin.install "safe-bundle"
  end

  test do
    assert_match "safe-bundle #{version}", shell_output("#{bin}/safe-bundle --version")
  end
end
