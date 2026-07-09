class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.0/agentsetup-v1.3.0-darwin-arm64"
      sha256 "68fa295f2f3394366a96ca0f42dd91e7f3a8adafd13526690999e4edaa3d78fc"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.0/agentsetup-v1.3.0-darwin-amd64"
      sha256 "e6a2439d4c80184aeef2ceaf0eaa113d612d240e04584aaa421c30b5bdbf0f21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.0/agentsetup-v1.3.0-linux-arm64"
      sha256 "2cdc36c4a4d4e43eb5bd2cae810511d0d0aa08501ff370dd53bffd07c72ba7aa"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.0/agentsetup-v1.3.0-linux-amd64"
      sha256 "87c92938d6bec3dfba956d08842a6abbc0689c017d8fbafacd2b049985880a5f"
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
