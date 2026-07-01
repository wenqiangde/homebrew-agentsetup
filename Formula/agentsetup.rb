class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.5/agentsetup-v1.1.5-darwin-arm64"
      sha256 "d874f83d6f54459fe5d184dbb357afa3db64728172ef3a9ca25b17089f912e85"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.5/agentsetup-v1.1.5-darwin-amd64"
      sha256 "9751a10523911627e346064c36856cd6e2b6b478813941926774b75660f1a3d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.5/agentsetup-v1.1.5-linux-arm64"
      sha256 "c20b246759d199cb22bb6e8507a0a60136f91828ac9062843610224573e725a4"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.1.5/agentsetup-v1.1.5-linux-amd64"
      sha256 "66b8c69e1931986f42cf953d09e634e79174ce44bce4dac8b59eb510c946f31c"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
  end
end
