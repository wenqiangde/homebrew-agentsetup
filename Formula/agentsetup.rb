class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.6/agentsetup-v3.0.6-darwin-arm64"
      sha256 "86497e7f2cf62322c554e2efa5b21c8ac6aafae06013f14c15b68147977893cf"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.6/agentsetup-v3.0.6-darwin-amd64"
      sha256 "6f548e173763cb74db24cc54a053851f16126889d4141215f2be1a6bec96ffd9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.6/agentsetup-v3.0.6-linux-arm64"
      sha256 "2d090991553566cbe212453abb3aa2377c24979382eaee3b839ddcb4d148cac4"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.6/agentsetup-v3.0.6-linux-amd64"
      sha256 "9977172354badce153d06193989571b8efba3ad5f8c3ad2a007b9d3fbe6b9703"
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
