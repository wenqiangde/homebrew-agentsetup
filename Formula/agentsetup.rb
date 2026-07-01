class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.4/agentsetup-v1.1.4-darwin-arm64"
      sha256 "ad7a3b4e5124da10bb4be9a62cfb0aab627d5eb2a6fe26fbd3a65bbba0602bea"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.4/agentsetup-v1.1.4-darwin-amd64"
      sha256 "aa1baedaace7a871bbc39aa632b0305cd953674cda1a64769cc5dc12e76b259d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.4/agentsetup-v1.1.4-linux-arm64"
      sha256 "ce4a49da31741b4774743ec845fb972d4ab499ebb049fb749776427d94e29490"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.4/agentsetup-v1.1.4-linux-amd64"
      sha256 "3ce84c67a4adba2d9bc64ff0a375bad7ebcb7c72b999668ac0c47dd06c524676"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
  end
end
