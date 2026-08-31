class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.2.0/agentsetup-v3.2.0-darwin-arm64"
      sha256 "6b213d2f94a7d8919eb402e98435f036677badd2ac505ea7ae4f1d5742024275"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.2.0/agentsetup-v3.2.0-darwin-amd64"
      sha256 "00c8490533d756f12b8a1f4a8039ab1ec9698ba2dac4ee5e230f1e2bf5a5226b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.2.0/agentsetup-v3.2.0-linux-arm64"
      sha256 "5e1c68c1d18fbfede14886a78e1165f2ca14cfbb26b1a1391d69dc4a10f85ffd"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.2.0/agentsetup-v3.2.0-linux-amd64"
      sha256 "5a51e22b127992e31a68b65f9666998e99e36c70e02bbcd539694f9befd6196e"
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
