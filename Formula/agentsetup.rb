class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.6.0/agentsetup-v3.6.0-darwin-arm64"
      sha256 "6608f268cafaec51adc74cdea4966cb5eac6e19dc46b171e6a7ceb10f4f9fa65"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.6.0/agentsetup-v3.6.0-darwin-amd64"
      sha256 "f427e93d2ac34a5a19beaf7348fc4ae677c2371fc9d78399ae8a1dea59336fa6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.6.0/agentsetup-v3.6.0-linux-arm64"
      sha256 "e11ed8715e689f1b9e42a38435e47595dff9d619018a5862769cc630d63a25b8"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.6.0/agentsetup-v3.6.0-linux-amd64"
      sha256 "599185d23ab0606d26cf2b5e9b8dd3a6bf94b1876e63fdbade63e4551f58a1f8"
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
