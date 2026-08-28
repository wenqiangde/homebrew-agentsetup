class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.1.0/agentsetup-v3.1.0-darwin-arm64"
      sha256 "0e1c85e4df15fbf6f093e08b2c9cd002ebfcdb92085c7bc4943eae26ecb3fec0"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.1.0/agentsetup-v3.1.0-darwin-amd64"
      sha256 "d91f67f9e6e6d161ef71fdbc04677f04adb086b052a47bfcbe27c2976312e87b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.1.0/agentsetup-v3.1.0-linux-arm64"
      sha256 "a37c526c96641ddde821aa8c64ef7c783578a8be2c162848727f0ebf060f5c01"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.1.0/agentsetup-v3.1.0-linux-amd64"
      sha256 "2e6655ae947efcf078caf56cb2064ab7147db2c4716ba1c61680452dbe4b16e3"
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
