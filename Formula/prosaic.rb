class Prosaic < Formula
  desc "Natural language generation from JSON-lines events"
  homepage "https://github.com/wildmason/prosaic"
  version "1.0.0"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on :linux
  depends_on arch: :x86_64

  url "https://github.com/wildmason/prosaic/releases/download/v1.0.0/prosaic-v1.0.0-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "f8f1da96d2a01106dc42d2f6aa8c68510f190a6dee7935c9f5d7bec3133fafb6"

  def install
    bin.install "prosaic"
  end

  test do
    input = "{\"key\":\"code.renamed\",\"entity_type\":\"class\",\"old_name\":\"Foo\",\"new_name\":\"Bar\",\"consumer_count\":3}\n"
    output = pipe_output("#{bin}/prosaic --vocab code --strategy sequential", input)

    assert_match "The class Foo was renamed to Bar, which impacts 3 direct consumers.", output
  end
end
