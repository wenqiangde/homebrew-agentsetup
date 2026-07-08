class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.2.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.12/agentsetup-v1.2.12-darwin-arm64"
      sha256 "6dd0d543323149e2d4d147430cda350bcab157f9b70d3f0592c71b6678dec336"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.12/agentsetup-v1.2.12-darwin-amd64"
      sha256 "c90eebfb11ed73204eb7d8b5aa16a3ba31843d988d456680ef95bc98053be29e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.12/agentsetup-v1.2.12-linux-arm64"
      sha256 "16fcbec70947ccce1ed7433d53a3ecbdc12c5e9b7d2b6e3f01d36c9383036118"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.12/agentsetup-v1.2.12-linux-amd64"
      sha256 "3c1a383c9954c21c96701c29ed983ecf77f2a9011520d2f071df92d90c70aa0a"
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
