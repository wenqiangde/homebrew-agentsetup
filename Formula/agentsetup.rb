class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.11/agentsetup-v1.3.11-darwin-arm64"
      sha256 "b4e1b7a8709eb27505ec61e2be1a2ea8df680b13dfe30eefd3d4370078939a2c"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.11/agentsetup-v1.3.11-darwin-amd64"
      sha256 "d677c3c6fa57a6af96960915b90a4dc182360b7ff94a1b40f9d197f5c1e813ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.11/agentsetup-v1.3.11-linux-arm64"
      sha256 "d4a885b2a951de3d6a239ee20ecade95e475ad7f3ff60dcfbe774c218ba360ff"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.11/agentsetup-v1.3.11-linux-amd64"
      sha256 "8e28a2fd6b6760fb228414bfd2d54a5185bdd80fca4204a5ee39c88040308986"
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
