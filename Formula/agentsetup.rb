class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.7/agentsetup-v1.2.7-darwin-arm64"
      sha256 "41e9314c7c77134b4187e139cd38111caee9d298ab2e39ed75c61d5c3b454365"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.7/agentsetup-v1.2.7-darwin-amd64"
      sha256 "45bba16594a31377a293b43e766e7b9ba7a58280b739f75f7122632dd5b3c33f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.7/agentsetup-v1.2.7-linux-arm64"
      sha256 "e50d78d8553248ceeb99b82cbbb24174df73330523613f30da415005d9d5c8f2"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.7/agentsetup-v1.2.7-linux-amd64"
      sha256 "b141dc895df56abfd1d4bce0ff3130634e894802f5f8eb8485d1368f761e5e2d"
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
