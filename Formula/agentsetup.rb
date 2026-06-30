class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.3/agentsetup-v1.1.3-darwin-arm64"
      sha256 "1de2bdfa708a19192e8a43273bc9f8870dcdc51b32793c577a437551828c7761"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.3/agentsetup-v1.1.3-darwin-amd64"
      sha256 "129808972ec5e917aecf9da3b43ce68b4bb5c1ce712f69f36cfd1d94ef06169c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.3/agentsetup-v1.1.3-linux-arm64"
      sha256 "b086a0c0b1180a4207a71a83ecd8a5ab1fb523c2cf166fa0b6e4569157db1c75"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.3/agentsetup-v1.1.3-linux-amd64"
      sha256 "e7af2530b97a5a66c2cee003e954ff89a99d5c0868d80f8453c632ac5713106a"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
  end
end
