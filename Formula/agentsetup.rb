class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.7.0/agentsetup-v3.7.0-darwin-arm64"
      sha256 "79aadab9ffc1fb1a9964021b677e6448c33135b6ab64c286009638f100510b20"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.7.0/agentsetup-v3.7.0-darwin-amd64"
      sha256 "7524d7ceab7282d38777df069ac86d7d1ff885e0829b29bcc9769af98dad5319"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.7.0/agentsetup-v3.7.0-linux-arm64"
      sha256 "7efde32b3d8e832b9b92e448095b512a516945df02586ef410d0ae7566fa7ea7"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.7.0/agentsetup-v3.7.0-linux-amd64"
      sha256 "ac443d69f3b2cd25a4a92604edb681e69f9b1b8f56278d37511925812984aa20"
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
