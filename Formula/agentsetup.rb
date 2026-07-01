class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.0/agentsetup-v1.2.0-darwin-arm64"
      sha256 "d588460316ba77e8e0abf52d75fc848b348778d255fef9ddb73778c8c01a565c"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.0/agentsetup-v1.2.0-darwin-amd64"
      sha256 "5f9b04c3226bca17461f59cbbf20c203c527316909e5ca6c923f7f5c3ea77962"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.0/agentsetup-v1.2.0-linux-arm64"
      sha256 "94eb92cff2e64839c65d80943bda80dcf81e45344082f2b4fe2bf2eac1c39fe5"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.0/agentsetup-v1.2.0-linux-amd64"
      sha256 "7cb24bde1928b1d6e07ebd627af0d6df6e6edfb6c3f5e3271ee2b907737646d4"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
  end
end
