class Airplane < Formula
  desc "Stateless AI-ops REPL (Bash)"
  homepage "https://github.com/yuval-a/airplane"
  url "https://github.com/yuval-a/airplane/releases/download/v0.1.0/airplane-v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_SHA256"

  depends_on "bash"
  depends_on "jq"
  depends_on "curl"

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

