class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.4/agentsetup-v3.0.4-darwin-arm64"
      sha256 "713ebac5502a3ea269d137f308d8844c88b66fc7a48c4464039ee53f29b2f276"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.4/agentsetup-v3.0.4-darwin-amd64"
      sha256 "3847f722fecb7aa9c4dde62902c4b4cec15140e7d7bf3fe60034755a15544490"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.4/agentsetup-v3.0.4-linux-arm64"
      sha256 "d1d970f5bd742892c507c4ebd76b0e4e6e671584dc7dc8ca3685491073ae8748"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.4/agentsetup-v3.0.4-linux-amd64"
      sha256 "0a86623f86c78e1f6ad46189977d3791765f11f0cbcbb93d93c06cd9c5ab3370"
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
