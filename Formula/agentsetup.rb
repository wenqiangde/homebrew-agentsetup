class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.14/agentsetup-v1.3.14-darwin-arm64"
      sha256 "25281b75d7654f5bf7d9df6bafdcb2cc8e9c1517cbe222fcf47efe34f995a8b0"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.14/agentsetup-v1.3.14-darwin-amd64"
      sha256 "df2e489f25c61b2bc91c9c5511761c8874a842a1dd90d656fad94e93ad2d9636"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.14/agentsetup-v1.3.14-linux-arm64"
      sha256 "d9113c453fa86b431e5f38152c192482641a302e03e2f7533161c1068f19289b"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.14/agentsetup-v1.3.14-linux-amd64"
      sha256 "a0737760560d6d3e71725c119688951797968d517fc2db39f0a9659be1648d13"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
    chmod 0755, bin/"agentsetup"
    generate_completions_from_executable(bin/"agentsetup", "completion")
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
    assert_match "#compdef agentsetup", shell_output("#{bin}/agentsetup completion zsh")
  end
end
