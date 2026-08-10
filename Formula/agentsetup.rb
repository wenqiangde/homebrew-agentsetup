class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.0/agentsetup-v3.0.0-darwin-arm64"
      sha256 "8b8a406bfd8083cf8902a4cae4235697d6e89952db6e4cb0d099b949dcb4d1c7"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.0/agentsetup-v3.0.0-darwin-amd64"
      sha256 "94c8eda2eac4f39e488a6fbd4c981808708c5dc69f18bbc1a141f3e2390dd780"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.0/agentsetup-v3.0.0-linux-arm64"
      sha256 "2896bed54315d1b8fd7509f906235ae48c3331c03f64c6206a10ceb80c01000a"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.0/agentsetup-v3.0.0-linux-amd64"
      sha256 "3c01c97fbf0a6f56fd5a7a9e51059aa6d27a2317a3a56e7f8650f381565081c3"
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
