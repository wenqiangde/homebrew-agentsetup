class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.3.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.3.8/agentsetup-v1.3.8-darwin-arm64"
      sha256 "4d6df8dccf3a37b6a5e136dc2af0ae4f4a59023404d807eef03ea611205ea8f8"
    else
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.3.8/agentsetup-v1.3.8-darwin-amd64"
      sha256 "219b28c08288bd84711c6016f37023a0ae531305cd193b0af24a16e123b49637"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.3.8/agentsetup-v1.3.8-linux-arm64"
      sha256 "a21fb57011bc761ecba6bec58053a31d0f820fcc688874ccadb3ac690f241666"
    else
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.3.8/agentsetup-v1.3.8-linux-amd64"
      sha256 "010f9b1b55796e17103e412667b64a9be7c517999149b9505dc122441f7773e0"
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
