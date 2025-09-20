class Airplane < Formula
  desc "Stateless AI-ops REPL (Bash)"
  homepage "https://github.com/yuval-a/airplane"
  url "https://github.com/yuval-a/homebrew-airplane/releases/download/v0.3.2/airplane-v0.3.2.tar.gz"
  sha256 "68dbd4cc3b3fae53fcee202a4f97c45bb02aac9b74ba8f799c330681464f4262"
  version "0.3.2"

  depends_on "jq"
  uses_from_macos "curl"

  def install
    libexec.install Dir["*"]
    (bin/"airplane").write <<~SH
      #!/usr/bin/env bash
      exec "#{libexec}/airplane.sh" "$@"
    SH
    chmod 0755, bin/"airplane"
  end

  test do
    assert_predicate bin/"airplane", :exist?
  end
end
