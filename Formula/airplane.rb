class Airplane < Formula
  desc "Stateless AI-ops REPL (Bash)"
  homepage "https://github.com/yuval-a/airplane"
  # Artifact hosted in tap repo release
  url "https://github.com/yuval-a/homebrew-airplane/releases/download/main/airplane-TAG_PLACEHOLDER.tar.gz"
  sha256 "f556b3726e8abba79c40a414c4690211f9c781bc64c6723a2092251a70f3f161"
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
