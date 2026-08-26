class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.5/agentsetup-v3.0.5-darwin-arm64"
      sha256 "1ba664051e45be182a6a2db5e0afdc529fec1df32286cd3b8204483ff8c104e3"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.5/agentsetup-v3.0.5-darwin-amd64"
      sha256 "ff34b1bb8d0ff88f22705f6705fcbc2c955d7aada35e68a24c573c1aa9374985"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.5/agentsetup-v3.0.5-linux-arm64"
      sha256 "29666b38eeb8743c777fbb567ce1171696f73547db2eaeabb6846fe4fce8778d"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.5/agentsetup-v3.0.5-linux-amd64"
      sha256 "42cb8dd2dca65d23c97328594395eefcada02cae6d033adeb97e690e154fe52a"
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
