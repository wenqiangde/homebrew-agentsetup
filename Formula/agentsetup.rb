class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.3/agentsetup-v1.2.3-darwin-arm64"
      sha256 "0d307d4ea398979cb5ea81a7c51738c38715ce1cd52c27a8d766f66a33ab612a"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.3/agentsetup-v1.2.3-darwin-amd64"
      sha256 "0ed16301e5b7ff953e37724c2679eb81737142a0462d5725a6d594484c9835a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.3/agentsetup-v1.2.3-linux-arm64"
      sha256 "46aee3c15f25c880a0df4c63d0c16b77400e73a7fc22dad85db92ed44b4cb3b2"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.3/agentsetup-v1.2.3-linux-amd64"
      sha256 "422188e58e4ca63c2b0e4304375675d4b94c364ad8d926fa60cd0f36d8178793"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
    generate_completions_from_executable(bin/"agentsetup", "completion")
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
    assert_match "#compdef agentsetup", shell_output("#{bin}/agentsetup completion zsh")
  end
end
