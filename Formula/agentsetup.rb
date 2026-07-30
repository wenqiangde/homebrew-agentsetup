class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.3/agentsetup-v1.3.3-darwin-arm64"
      sha256 "ce0796757dd5227eafdaf7280fc8c8297be3eac5aea79d46f87e4905c87012f9"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.3/agentsetup-v1.3.3-darwin-amd64"
      sha256 "a59d38f752c13f43debf208de7f3980edc21c809f5ab27c2de0c51c5f340628a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.3/agentsetup-v1.3.3-linux-arm64"
      sha256 "60b30b1817afb68dcf4483478f2fe2aa6ac6c4a74ecdd32e29b2ac595f7364a5"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.3/agentsetup-v1.3.3-linux-amd64"
      sha256 "8973d67a6f2664819316ab1624f06ff6d5a8da305416e232302a242dd29c15ad"
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
