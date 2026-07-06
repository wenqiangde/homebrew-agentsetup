class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.6/agentsetup-v1.2.6-darwin-arm64"
      sha256 "0afe9062413ba13fce984881cf6363c804bd7fefce43ef883eda6ec5934f926b"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.6/agentsetup-v1.2.6-darwin-amd64"
      sha256 "76c210cbd3ada35cbb97fb5ee3772b4a1e86730ff50d92ac475ea49eb3a1406b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.6/agentsetup-v1.2.6-linux-arm64"
      sha256 "3de31df39ad94ee5bb2a52c0a5d44e5bf1ed5e78777f08cead7c299c138aaf03"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.6/agentsetup-v1.2.6-linux-amd64"
      sha256 "000a9cb6a4c49ddf6961dc8b70f5558407983cb9b5ec3c2a55fc196f548c899c"
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
