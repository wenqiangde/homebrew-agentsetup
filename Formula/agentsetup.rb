class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v2.1.0/agentsetup-v2.1.0-darwin-arm64"
      sha256 "79ecdbe7d21f632abe14965e1f857852faed68ad1c2d2faeccd221189239da03"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v2.1.0/agentsetup-v2.1.0-darwin-amd64"
      sha256 "39f4806ea4884a1ca30e350fb751e8d8ddbdc97779f19f41658b644ad5c3863a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v2.1.0/agentsetup-v2.1.0-linux-arm64"
      sha256 "fff519945d8366ba1c2b0aae4dea125f5d2ff9da084b608b156bd33f0f638f70"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v2.1.0/agentsetup-v2.1.0-linux-amd64"
      sha256 "c6172790b239b25c22d3eb63ce12a685c866f3d82ba7c0bd43d11e1aa9691cd1"
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
