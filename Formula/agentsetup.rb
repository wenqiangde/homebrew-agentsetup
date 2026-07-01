class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.8/agentsetup-v1.1.8-darwin-arm64"
      sha256 "71e1a339ed6440a0fd2beff1075b97fc420d7bf8469a1c4afedf510b2ed2e3a5"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.8/agentsetup-v1.1.8-darwin-amd64"
      sha256 "0f7aa32d7c839b620245c0a5aba64aa92d740078325d242e3ee7d65644fb4b2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.8/agentsetup-v1.1.8-linux-arm64"
      sha256 "6f079f4c7c23e1bb0075422dc356ac27de1d8f46e3df6f5029bc5deea495a98d"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.8/agentsetup-v1.1.8-linux-amd64"
      sha256 "e00baacc4f13a5badfec5b5f5d8f5286825e294b97d51852ee4ab08a040e549c"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
  end
end
