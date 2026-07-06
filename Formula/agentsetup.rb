class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.2.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.9/agentsetup-v1.2.9-darwin-arm64"
      sha256 "313f8d96f6ece31f7029b5c4269368e1794c44d59006a38768f593b620c63321"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.9/agentsetup-v1.2.9-darwin-amd64"
      sha256 "2173aa121071c5c96787673f2737b885df3ffc01b0812fa8993ad4f3ce6ecf40"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.9/agentsetup-v1.2.9-linux-arm64"
      sha256 "eed5274239087d0c076330f3e362652822a5ae86d7113ece2eb039ba96b2ead7"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.9/agentsetup-v1.2.9-linux-amd64"
      sha256 "cd9fd58a028b8ae624f087e4180308493fe6c3fa516456bcdfe637ee1bbf8097"
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
