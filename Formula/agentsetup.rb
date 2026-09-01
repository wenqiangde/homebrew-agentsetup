class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.3.0/agentsetup-v3.3.0-darwin-arm64"
      sha256 "bfe88de7a48aaddc239a08bfee1c254ea32ba8697583419286b51853d157da32"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.3.0/agentsetup-v3.3.0-darwin-amd64"
      sha256 "1de07f2c1c15584dc9af046aaef2153b4d3584b60ba33a5e1eb36d1e88882398"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.3.0/agentsetup-v3.3.0-linux-arm64"
      sha256 "502af819cd4ac14e6998dd28f88d9c4c3c357a42ee8c3e18ee41358999aff11b"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.3.0/agentsetup-v3.3.0-linux-amd64"
      sha256 "6ca6b6f3bde2d2347bed9090c1593ad7a60ebf3c524e434035d17c02d9966ab2"
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
