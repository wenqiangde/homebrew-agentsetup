class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.3/agentsetup-v1.1.3-darwin-arm64"
      sha256 "a8262a6b855748b93de7c7da149b711fd75d5549d0145a09ef1ae2121223f33e"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.3/agentsetup-v1.1.3-darwin-amd64"
      sha256 "fe3c43de68f41c01358cc69f35dbac9921f74ce7949f3b706d5df96caa97ce87"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.3/agentsetup-v1.1.3-linux-arm64"
      sha256 "2b06853e1a35018f997bf86ff2c7ab33b9236937c167ed71e8e6d2d4f175a4b6"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.3/agentsetup-v1.1.3-linux-amd64"
      sha256 "24de97f281b5d46ae4eff7551bf0763b289c098ed2045f9ac4f63c240cc17035"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
  end
end
