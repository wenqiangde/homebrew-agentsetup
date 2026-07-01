class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.7/agentsetup-v1.1.7-darwin-arm64"
      sha256 "a257eae93288c3b7ac6498015c96eac7c21859c54e5910d923c06d13d4ac1771"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.7/agentsetup-v1.1.7-darwin-amd64"
      sha256 "4eeffb579c66b5a1e31a889208dbdd48bcf1dadfd2742dd1a951c77de50a68fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.7/agentsetup-v1.1.7-linux-arm64"
      sha256 "8b7c6f2c8bee38640fb7031af08fcde4fee4ca37019d4eef181a5d21b62fa7a3"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.7/agentsetup-v1.1.7-linux-amd64"
      sha256 "a794f2690cc0acf65d5a625f4368302746d2c022272fe58c9a93e0c13b6980ea"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
  end
end
