class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.3.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.9/agentsetup-v1.3.9-darwin-arm64"
      sha256 "d894550f3e09c1f82e3d1559779365889d387fd2f9b8208803026a5d149b6316"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.9/agentsetup-v1.3.9-darwin-amd64"
      sha256 "26894f9684a9f4e2fdc94fe144f420f09316df0661d9ed1abeb537afe4ca4817"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.9/agentsetup-v1.3.9-linux-arm64"
      sha256 "dbafbc08a0defbd6edeb76a22713b955d7284ca09081dbe84fd609a13738873e"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.9/agentsetup-v1.3.9-linux-amd64"
      sha256 "7fec4593d7bbb9198303e340f7468b3802cae6de1049b3fd43ab1d74b70b9b98"
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
