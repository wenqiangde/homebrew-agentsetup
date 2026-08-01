class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.5/agentsetup-v1.3.5-darwin-arm64"
      sha256 "c9b7773c84157dd2bc527ab5cda20540ae27832ba3d7ce98ea4baa3c3e97d3b6"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.5/agentsetup-v1.3.5-darwin-amd64"
      sha256 "2a7aa0bbb39ea37ed8bfc7302dbb46f6bcb307f2665dfb351b5598775b6d15e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.5/agentsetup-v1.3.5-linux-arm64"
      sha256 "9b5d7fb92e5aa41c8d1af38f240773d15701a18f731ca142a5e812f9e2de476f"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.5/agentsetup-v1.3.5-linux-amd64"
      sha256 "1097f95fa8d6c13711956fdcdcc6232798aab87d80236bb03a54517a90305dc3"
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
