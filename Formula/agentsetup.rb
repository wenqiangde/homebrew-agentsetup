class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.5/agentsetup-v1.3.5-darwin-arm64"
      sha256 "56d08a3893fe96c81002eaf4c887a4b5591559f7739d6a95b6065d480ec5e052"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.5/agentsetup-v1.3.5-darwin-amd64"
      sha256 "366fea91b96df8a17d81b90945886e41480b7d4ec9f80d528de66de4fcafa604"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.5/agentsetup-v1.3.5-linux-arm64"
      sha256 "a0c1badc4374dc79464850ca6b551b2ba4be64e297fada3931e86f88c6a6c78b"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.5/agentsetup-v1.3.5-linux-amd64"
      sha256 "2c32998cb80810e4b300133e7bfa2f44e9875488a3d40ee0b186ffcc0a83b532"
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
