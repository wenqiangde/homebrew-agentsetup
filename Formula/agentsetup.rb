class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v2.0.0/agentsetup-v2.0.0-darwin-arm64"
      sha256 "f36ae7491e464313c5cbdf8e8ff66ce768b764ecbdf068faa4bbc9718f6acd16"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v2.0.0/agentsetup-v2.0.0-darwin-amd64"
      sha256 "b998572fa40dfb73025ceb1a6e3179378eb7347893d95e0c468a6395ab33a953"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v2.0.0/agentsetup-v2.0.0-linux-arm64"
      sha256 "da6200305a3848fa7dd6cd09ac6494f6a86255262a0b601850cdae873c997bd2"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v2.0.0/agentsetup-v2.0.0-linux-amd64"
      sha256 "0c00606a7a3e08ed4b0fb3bcd0d6d949c4cadc6bc2e64be8eac679d10b10180b"
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
