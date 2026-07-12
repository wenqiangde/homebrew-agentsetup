class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.2/agentsetup-v1.3.2-darwin-arm64"
      sha256 "96a7222741cefc3ba592062f126ca8b600970214d15e2b9fa297a2b39ceee71d"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.2/agentsetup-v1.3.2-darwin-amd64"
      sha256 "c5608dd67f197280ec3aeca34ade0c57ec0a775349c0c20b50f117d919c9540b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.2/agentsetup-v1.3.2-linux-arm64"
      sha256 "4611f4157d4ecbea3067785d0e0205ad2a5aeb02701544f6f0e430f9fbe5162c"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.2/agentsetup-v1.3.2-linux-amd64"
      sha256 "79c125b04fa8476d18fb3726714afc8ba8e079dec2e0d902e6f8169fbac0cc86"
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
