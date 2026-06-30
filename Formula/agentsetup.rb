class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.1.0/agentsetup-v1.1.0-darwin-arm64"
      sha256 "2cbfae7417e7bb68f00c174376ae7953cd7393cbabce80dde95acb6356018159"
    else
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.1.0/agentsetup-v1.1.0-darwin-amd64"
      sha256 "6dd1fa9a7cd2e6f6cbcbb5786ca9047cac5a4dbf54418702b4b11e2cf4dde3ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.1.0/agentsetup-v1.1.0-linux-arm64"
      sha256 "9d47b363aa6522c5eebfb0c5a06221132c3d53228bd76721addb4ee61d6305e3"
    else
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.1.0/agentsetup-v1.1.0-linux-amd64"
      sha256 "5c937797dc79587c49e551e5e9ee22640bef4b44bbbef33026777186142aae4d"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
  end
end
