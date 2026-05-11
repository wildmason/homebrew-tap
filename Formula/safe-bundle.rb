class SafeBundle < Formula
  desc "Local-first redaction and safe support bundle CLI"
  homepage "https://github.com/wildmason/safe-bundle"
  version "1.0.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wildmason/safe-bundle/releases/download/v1.0.0/safe-bundle-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "1fddec504ddd52e1e8f75c2f282d6f4c9940afcf25c2dbb6f06201de1e388ad8"
    else
      url "https://github.com/wildmason/safe-bundle/releases/download/v1.0.0/safe-bundle-v1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "a61e4de8fc2a700606ac6474aa0717cc1161389187e3466175208a80da09821e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wildmason/safe-bundle/releases/download/v1.0.0/safe-bundle-v1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e60a2f4c548841384aa50c2b6e82e31e9f3a7f7cdbe4011ea044ada48f1fd92d"
    end
  end

  def install
    bin.install "safe-bundle"
  end

  test do
    assert_match "safe-bundle #{version}", shell_output("#{bin}/safe-bundle --version")
  end
end
