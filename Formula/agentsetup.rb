class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.1/agentsetup-v1.2.1-darwin-arm64"
      sha256 "df235e10404dc5ced0360d5ae6c658a237798c2e04dded4f007703f5eba3491b"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.1/agentsetup-v1.2.1-darwin-amd64"
      sha256 "bd52313d6521e9623c5e5b388dd1e3705e1a3e9c3e47a17a733fd6e5f99d3838"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.1/agentsetup-v1.2.1-linux-arm64"
      sha256 "206c4d0ea4f1f078c0e4f30019f2215a0e6628b9b663b034d4c5d0eebf268bf6"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.1/agentsetup-v1.2.1-linux-amd64"
      sha256 "b7279607470f9635fd345a1fa752bfe2f70fbca19a6f1b1413c004c239327656"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
  end
end
