class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.4/agentsetup-v1.3.4-darwin-arm64"
      sha256 "8de9a535fa10054ef446002646a51c9d1d8cc6bc1802751d33c55e6d787bc771"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.4/agentsetup-v1.3.4-darwin-amd64"
      sha256 "ff738788901f9759d37b742184479fe5bc364b8d75e5003151b71e068989f9a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.4/agentsetup-v1.3.4-linux-arm64"
      sha256 "f55eb5d4b8e5d8a98e549768c7f77d338a8a305deaa6a0302cea369f5b2770f9"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.4/agentsetup-v1.3.4-linux-amd64"
      sha256 "b6bd02db463a4ec7f5b5ea84670ca6e76443d275c637b3111c3e46a8c6f0eb38"
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
