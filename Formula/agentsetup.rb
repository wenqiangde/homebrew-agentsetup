class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.5/agentsetup-v1.2.5-darwin-arm64"
      sha256 "6a44399e62d66757f7e369787486912f81e9a85ffd85eda3e4bc6d345a97bcb7"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.5/agentsetup-v1.2.5-darwin-amd64"
      sha256 "960e6ad6f403dd2b77f76248de6514066fc7392bd6444104fb6019cfe27bbd09"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.5/agentsetup-v1.2.5-linux-arm64"
      sha256 "c69be684b78c4036d3fdef1756e6934047c0456308123680bf69e34f6ed8fce2"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.5/agentsetup-v1.2.5-linux-amd64"
      sha256 "98f0915b87832427d1b814e42c70b752320b0a9e383216797d47448290a0d8eb"
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
