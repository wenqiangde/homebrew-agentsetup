class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.3/agentsetup-v1.3.3-darwin-arm64"
      sha256 "c7639959fa3e1f7eee2dcbf96fe8566d414dbdd0a4c8ad2e04bb4f62a92faa95"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.3/agentsetup-v1.3.3-darwin-amd64"
      sha256 "41f5d3672db751252a059de06cca22ce6d32d2a0f1a94014315ee61b25452a78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.3/agentsetup-v1.3.3-linux-arm64"
      sha256 "c02adfeec99f1b39596428f4df51c5e8870999542b2e939c98083ea2a5f7667e"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.3/agentsetup-v1.3.3-linux-amd64"
      sha256 "09f276a4f951150076097c3d9398644a902d0ac1dd91709e7fd80dfc4800085f"
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
