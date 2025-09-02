class Airplane < Formula
  desc "Stateless AI-driven REPL (Bash)"
  homepage "https://github.com/yuval-a/airplane"
  # Note: primary repo is private; artifact is published in public tap repo releases
  # Example for v0.1.1 (in tap repo):
  # url "https://github.com/yuval-a/homebrew-airplane/releases/download/v0.1.1/airplane-v0.1.1.tar.gz"
  # sha256 "<SHA256>"
  # version "0.1.1"
  url "https://github.com/yuval-a/homebrew-airplane/releases/download/v<VERSION>/airplane-v<VERSION>.tar.gz"
  sha256 "<RELEASE_SHA256>"
  # version "<VERSION>"

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
