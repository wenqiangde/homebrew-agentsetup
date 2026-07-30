class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.4/agentsetup-v1.3.4-darwin-arm64"
      sha256 "0687cd08f245b9a9683ab78066135a4d117bfe8e96024410bd83a770c89216cb"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.4/agentsetup-v1.3.4-darwin-amd64"
      sha256 "02c297a60fdbfc9992ecf82dbc419d8cb76fffc9caaeaaf56ae6aff7852aaa19"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.4/agentsetup-v1.3.4-linux-arm64"
      sha256 "11c0ba3f73ddc81bb76463ae6b5e1e22768b0798194e119cc51de827b47d68bd"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.4/agentsetup-v1.3.4-linux-amd64"
      sha256 "2fc5a1e3119f02c94974bddb5f8fb0df0173f22ccbb15fee11807253d0de3ef6"
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
