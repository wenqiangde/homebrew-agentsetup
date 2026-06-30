class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.1.1/agentsetup-v1.1.1-darwin-arm64"
      sha256 "75a401455e26254e51d775db28aaee5cec5e73e24600dd6bedc77a78e12d675d"
    else
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.1.1/agentsetup-v1.1.1-darwin-amd64"
      sha256 "47e7110362f22141e699345e9153e45570f7dbd04904c2583e4ca2e91b49dcf2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.1.1/agentsetup-v1.1.1-linux-arm64"
      sha256 "c60389e94315dfd5400e9e9be364b73c8407b49d8a19a261d3841c175ed475c8"
    else
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.1.1/agentsetup-v1.1.1-linux-amd64"
      sha256 "adf74b9f4d75c6cba175c0dee4ad9911d021b7ab9833d51a94e4c3285277d469"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
  end
end
