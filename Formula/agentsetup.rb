class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.2.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.11/agentsetup-v1.2.11-darwin-arm64"
      sha256 "d9c66ede825513f7215a7e9a87fa9febff015a34b0a5b8c3bf43b797d1cfc86b"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.11/agentsetup-v1.2.11-darwin-amd64"
      sha256 "cdf1941a7d92487cceb3cfb69f72b2c1a0669ea524e0a8f97edaaeec8119ff7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.11/agentsetup-v1.2.11-linux-arm64"
      sha256 "fe70111fd989ac663c19d7728dd8ba0a3f9d14624b1e71b4b3fda339d92c6083"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.11/agentsetup-v1.2.11-linux-amd64"
      sha256 "0644f27f7f3d636646e789b4b3f8b68dcc1e4d2c103378210b2ac11c4febedda"
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
