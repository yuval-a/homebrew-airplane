class Airplane < Formula
  desc "Stateless AI-ops REPL (Bash)"
  homepage "https://github.com/yuval-a/airplane"
  url "https://github.com/yuval-a/homebrew-airplane/releases/download/v0.4.2/airplane-v0.4.2.tar.gz"
  sha256 "7e2ace30d9fe6cb360fd74035e0f3b5a8b037b3c5da3f6f9fd857224c41c10d0"
  version "0.4.2"

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
