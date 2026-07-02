class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.2/agentsetup-v1.2.2-darwin-arm64"
      sha256 "6d053b5563f221bba99a381c1847027557c9c9c29fb80121d3248bbf986ededa"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.2/agentsetup-v1.2.2-darwin-amd64"
      sha256 "d1a78d857df544e1fcea4e2cee7db2f9384f1d6c3a4d57a0683da8c4a91a6042"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.2/agentsetup-v1.2.2-linux-arm64"
      sha256 "0b578e790f869a77fc0d34e6bd71d3c76237c38d70819c805e46400cd9a7826e"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.2/agentsetup-v1.2.2-linux-amd64"
      sha256 "d1f6f1c6f9f159ffb1c58209c8c74c88dde5a02dd6d3e3844e1a8501112965ab"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
  end
end
