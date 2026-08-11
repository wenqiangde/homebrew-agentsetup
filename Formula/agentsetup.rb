class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.2/agentsetup-v3.0.2-darwin-arm64"
      sha256 "775220cc01d35b509a771ac2753a2134e430d442dfc96b1889c5e219a1708f06"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.2/agentsetup-v3.0.2-darwin-amd64"
      sha256 "af8a9f297f303d0a5ed8f156247462b784c47ef10f85ab7c0be7e53faeabf64e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.2/agentsetup-v3.0.2-linux-arm64"
      sha256 "77467f5f50e4f25a70e6890576da28a8103b0e70ce9c9f320714a3ddeb80b245"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.0.2/agentsetup-v3.0.2-linux-amd64"
      sha256 "707c13ee454ac39d288f34937df7490a8b9275b118a74db6fb88c6e584a44bf5"
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
