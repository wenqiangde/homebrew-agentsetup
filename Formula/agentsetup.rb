class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.4.1/agentsetup-v3.4.1-darwin-arm64"
      sha256 "199b431c6bd7ae6d8b4b22602f8e01a999dbe75ecec55ec22dd4016f00dd4648"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.4.1/agentsetup-v3.4.1-darwin-amd64"
      sha256 "c4cca62a2b41de73e97e7862e1c64c5b3d835bac9a57372394c4b79f1190a5c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.4.1/agentsetup-v3.4.1-linux-arm64"
      sha256 "64b7edf371a931ae0e6e35e66f9878743f1ab5225d45b54cad883f9e28285540"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.4.1/agentsetup-v3.4.1-linux-amd64"
      sha256 "880ca780960c0737532a3e674c64245257e5562ad2c4fc762eb0391dcf0021c4"
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
