class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.3/agentsetup-v3.0.3-darwin-arm64"
      sha256 "483230d89c5e3e1b220f90243ca86296df09a7cc8be7f4948191b768436348e9"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.3/agentsetup-v3.0.3-darwin-amd64"
      sha256 "1e46af50a4f60c3f5b842090098a1bcd32f2311a17262c21ac5eee86ab62e480"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.3/agentsetup-v3.0.3-linux-arm64"
      sha256 "1fce7c52bed78776d4a526aa85324dcf707d2afd21eb4f00259fd66218f78e09"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.3/agentsetup-v3.0.3-linux-amd64"
      sha256 "c1af362ad9aaa8202afb683ece6e8c88385b1e8e6eeba326d286f0341311a3cc"
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
