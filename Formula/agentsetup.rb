class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.0/agentsetup-v1.2.0-darwin-arm64"
      sha256 "df34f8d9d17c641a283311b39af63e3c313d2e4f34e47eb10f924511184d18af"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.0/agentsetup-v1.2.0-darwin-amd64"
      sha256 "31a89d41ead8232cc947ede35bdf8f1bb44b759a98c6b736173f321882932b1a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.0/agentsetup-v1.2.0-linux-arm64"
      sha256 "8b06717d9279db25f8c9f67f1fe2c012e1d9d75d9189b7015966dd7f5b5b4640"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.0/agentsetup-v1.2.0-linux-amd64"
      sha256 "ab3df8b076f78e0aabb33a4a931ca3b7c5b28d1097eb79f97eea450c4be19d6d"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
  end
end
