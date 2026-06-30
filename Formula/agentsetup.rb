class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.1.2/agentsetup-v1.1.2-darwin-arm64"
      sha256 "5f458104121e0e5ff7756969577dd2d4367f8755755be56226925b5b451f26c1"
    else
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.1.2/agentsetup-v1.1.2-darwin-amd64"
      sha256 "8a040c711d3e608a334320952c278acd4fe0d93344adc58246dca841623e4842"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.1.2/agentsetup-v1.1.2-linux-arm64"
      sha256 "d8fe7ea98c902c04c14316b93c9634f2242331b419ccca7afd54834b2acb8eb1"
    else
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.1.2/agentsetup-v1.1.2-linux-amd64"
      sha256 "b5d45997928a494a848bec30b460cda885728e2b7514c43c35ace14a32797a9d"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
  end
end
