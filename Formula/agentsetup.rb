class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.1/agentsetup-v1.3.1-darwin-arm64"
      sha256 "3db332987387a9e9528b3363a3ef3fe3ad406c60a4cd981cf6cba0da496b7377"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.1/agentsetup-v1.3.1-darwin-amd64"
      sha256 "093699b957ad7bbf9638115a9d36fe389450337a6e4cce7a8f245148a77d176a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.1/agentsetup-v1.3.1-linux-arm64"
      sha256 "12c92e72601a5ed5043e546ec5a849158c7c4c364815c48cfb457906e468f53d"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.1/agentsetup-v1.3.1-linux-amd64"
      sha256 "e58aaebebcb778fd03bfbc19c47242a9b3fd7d67e19b6b47a91e532e9b24a2f4"
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
