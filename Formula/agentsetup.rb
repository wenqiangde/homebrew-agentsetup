class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.9/agentsetup-v1.1.9-darwin-arm64"
      sha256 "b31c8838f3bfdfb6d48fca3fe98fe60bac9821d37a0f0a3140690dafdb53bc46"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.9/agentsetup-v1.1.9-darwin-amd64"
      sha256 "1f49c0eaf4f18d742ea1ca61e9f1ae613597458a200b5faca235c68fb0df2e88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.9/agentsetup-v1.1.9-linux-arm64"
      sha256 "ce2799cb6bfbad8b3e75d8c9bdcf6326cac35eb69856d182e3559432829b05f9"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.9/agentsetup-v1.1.9-linux-amd64"
      sha256 "a22e69b775e0a86b82002281b8df1429b7e04d2bf1d1522d796d64ba4c8c5716"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
  end
end
