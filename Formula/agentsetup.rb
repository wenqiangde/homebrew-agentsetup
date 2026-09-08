class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.4.0/agentsetup-v3.4.0-darwin-arm64"
      sha256 "c771ef0c1129d9ae578478bde8323e19d9b1b049c4a05cd6611752cc5c224676"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.4.0/agentsetup-v3.4.0-darwin-amd64"
      sha256 "1037e2effbb589baa7c5652d81b38dd21a3881437a0bc33dcf23fa436abae817"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.4.0/agentsetup-v3.4.0-linux-arm64"
      sha256 "def523cfd0ef48d2ba4e7b471c378407dcccf7e028ab3d38d58a7a6960b90f32"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.4.0/agentsetup-v3.4.0-linux-amd64"
      sha256 "d262c3a8437ab1dc0e2de6837f70aeca4273390a7c4b71166cf3b5994d7625c0"
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
