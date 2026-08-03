class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.10/agentsetup-v1.3.10-darwin-arm64"
      sha256 "a5ceb495b35e6a80d65d2de039f3f0aea9dce3f88d04262e0fd46928b46220fb"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.10/agentsetup-v1.3.10-darwin-amd64"
      sha256 "d153954fe334fcf28e626d294ffc10e14f8ad2fdbcefe1ee765cb2fa91408bf0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.10/agentsetup-v1.3.10-linux-arm64"
      sha256 "e13d577031df9efa31efdcf322c1a0e40f361abf2a0c93b7281dd506cf8cc107"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.10/agentsetup-v1.3.10-linux-amd64"
      sha256 "16de6e4fa804ec139b36e7cdf40621d8a51e126879143af10dbbcf9f58dce605"
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
