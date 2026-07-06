class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.2.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.10/agentsetup-v1.2.10-darwin-arm64"
      sha256 "590ba0cb95afb04c5a57debc212bcd93bdb9db9dc29e203113d496fb73f6cb06"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.10/agentsetup-v1.2.10-darwin-amd64"
      sha256 "e7cf4d826ce6a5c597d7e2ee94b2507f80331489d68c74eb5916c4cdaa800365"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.10/agentsetup-v1.2.10-linux-arm64"
      sha256 "f10cb6e6e9e4ffd30383d6e62065b1a6d1d1ced63f69f459c5d5946305e018bf"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.10/agentsetup-v1.2.10-linux-amd64"
      sha256 "2c4e80a3f8fadbebbc3fd8224333f1df46ee8118b12a6fa088716041b97fdb01"
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
