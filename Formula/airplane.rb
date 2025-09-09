class Airplane < Formula
  desc "Stateless AI-ops REPL (Bash)"
  homepage "https://github.com/yuval-a/airplane"
  url "https://github.com/yuval-a/homebrew-airplane/releases/download/v0.2.4/airplane-v0.2.4.tar.gz"
  sha256 "6125644fa8993e0236b70c916373d2178ee0595cd8ad36fee7392f30752292b8"
  version "0.2.4"

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
