class Airplane < Formula
  desc "Stateless AI-ops REPL (Bash)"
  homepage "https://github.com/yuval-a/airplane"
  url "https://github.com/yuval-a/homebrew-airplane/releases/download/v0.2.6/airplane-v0.2.6.tar.gz"
  sha256 "f78d1b1b486344e343e1b157d13b43d91f217b11a986beb37c2f5f245e39c7b2"
  version "0.2.6"

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
