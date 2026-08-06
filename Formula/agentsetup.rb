class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.16/agentsetup-v1.3.16-darwin-arm64"
      sha256 "db294aecd699ef2e80b2d90bbb74bb8508798e83cb791640dedee3b894ec0f90"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.16/agentsetup-v1.3.16-darwin-amd64"
      sha256 "be40dbe350af1bc48ed97137900edf712564e60a665e7113b7a2d37f94f33011"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.16/agentsetup-v1.3.16-linux-arm64"
      sha256 "199ab1240d2ddbafb622d61217cb4e6d3227ea464f43fe20d7f9e35e9caa8c36"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.16/agentsetup-v1.3.16-linux-amd64"
      sha256 "c590f8c49d6fcc2500b4147cde5e459282a4d169ff71a02d585c5ee190e3f8ac"
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
