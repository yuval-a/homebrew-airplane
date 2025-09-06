class Airplane < Formula
    desc "Stateless AI-ops REPL (Bash)"
    homepage "https://github.com/yuval-a/airplane"
    url "https://github.com/yuval-a/homebrew-airplane/releases/download/v0.1.1/
airplane-v0.1.1.tar.gz"
    sha256 "<paste sha256 from v0.1.1 release>"
    version "0.1.1"

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
