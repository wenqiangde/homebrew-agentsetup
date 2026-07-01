class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.7/agentsetup-v1.1.7-darwin-arm64"
      sha256 "28fcf8703a039e436e1d1ae240d4a157d7f0a3f8d7058e465c54566080842769"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.7/agentsetup-v1.1.7-darwin-amd64"
      sha256 "e6bb0ffda095a87389771d4de1d0868a9e2f626eb4d5c211e67d7fcf784191af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.7/agentsetup-v1.1.7-linux-arm64"
      sha256 "f4222dc9c028053eda612af921a782803ae4f0d023ed06315328a06b375ea13a"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.7/agentsetup-v1.1.7-linux-amd64"
      sha256 "56c2e376110ecdefb37ae3a7635903e6d8ec063a966a0cf07e2a481a8a5088cb"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
  end
end
