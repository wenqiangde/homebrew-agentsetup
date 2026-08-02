class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.6/agentsetup-v1.3.6-darwin-arm64"
      sha256 "0443b8306d540a70959633db21b94f18f1ba5310f38392c0048b5de3fa7f08cf"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.6/agentsetup-v1.3.6-darwin-amd64"
      sha256 "941a0d32015928f0e56ed02d06823cd383d6366300e65b96b2859cd0d5cbc155"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.6/agentsetup-v1.3.6-linux-arm64"
      sha256 "c64193c057456e28ceb5225546fd992ae5cad75ca8592a0d634d6e78a22b49ff"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.6/agentsetup-v1.3.6-linux-amd64"
      sha256 "9871a80465826d8c37bbbd3b9132ff73915e95a4873d9aba0348b6b09bf77a60"
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
