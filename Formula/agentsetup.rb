class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.12/agentsetup-v1.3.12-darwin-arm64"
      sha256 "4ec1cdc8693873a2bb8cb6b642d98e63d12bf5514369eb7f3dbff3aa8c382116"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.12/agentsetup-v1.3.12-darwin-amd64"
      sha256 "aa464f6b8226d449dbee519c4c9adc7b4403092ddcef267347b0391e9fac3b6c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.12/agentsetup-v1.3.12-linux-arm64"
      sha256 "7e134f90382fb1814eb53067bc620f173c40fd8d604b0ee893391610a85a84fd"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.12/agentsetup-v1.3.12-linux-amd64"
      sha256 "3595768f0fa3d090d03eeaec9d65c5edfd6a53403655437e369f688f4eb28e09"
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
