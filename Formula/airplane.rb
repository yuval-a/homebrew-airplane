class Airplane < Formula
  desc "Stateless AI-ops REPL (Bash)"
  homepage "https://github.com/yuval-a/airplane"
  url "https://github.com/yuval-a/homebrew-airplane/releases/download/v0.4.6/airplane-v0.4.6.tar.gz"
  sha256 "ac4693398b6107256fdfc52d05d0dead9923bf3f85a17da44e31af9c2949982b"
  version "0.4.6"

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
