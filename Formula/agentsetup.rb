class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.13/agentsetup-v1.3.13-darwin-arm64"
      sha256 "6e0def442c74d18a637b3bd94d390158659ee934f86e5c10ffced53f9aa7fb58"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.13/agentsetup-v1.3.13-darwin-amd64"
      sha256 "283cd278f9a8206fa3d7f88eab70797d4ba624bbb199bd0c364356fab8e20ac3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.13/agentsetup-v1.3.13-linux-arm64"
      sha256 "27a2f09eed278204e8cea370262cf6c6792e1f926ccb7232fef5dc9c413ea5aa"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.13/agentsetup-v1.3.13-linux-amd64"
      sha256 "2963cf51d14d32a56012d0edd99fa8443075ba0f9e5a930201727f9e3eb9fddf"
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
