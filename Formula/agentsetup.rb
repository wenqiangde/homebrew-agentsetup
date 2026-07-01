class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.6/agentsetup-v1.1.6-darwin-arm64"
      sha256 "0289620cc4f9c4266372e1dca71032b71b72b534878768e94906eb8e6f8a698e"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.6/agentsetup-v1.1.6-darwin-amd64"
      sha256 "2a27f965e98de9bd667290fb66939ee6e3815e65a196ec944694437c11bf0323"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.6/agentsetup-v1.1.6-linux-arm64"
      sha256 "59fde2673724ff31f1e9ca5737a79d0436a541e929f16c4a409ffa17df484de4"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.6/agentsetup-v1.1.6-linux-amd64"
      sha256 "16b27ccc9d256a305f731b191aeda11174799594d766a61c9d0957558a5aa05c"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
  end
end
