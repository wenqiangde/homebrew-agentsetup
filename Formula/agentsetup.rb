class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.4/agentsetup-v1.2.4-darwin-arm64"
      sha256 "0dfd9f986db0d595caaebdb8865cc72569d58b104fe11824912e8d55441b21cc"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.4/agentsetup-v1.2.4-darwin-amd64"
      sha256 "d7197a2bc80c313e2a4c624b170d6219bc6e826b9d331c04acad73e7950a76ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.4/agentsetup-v1.2.4-linux-arm64"
      sha256 "4e7ac1e3cc5ee9a48c749848e7f11a694cf138be1aa0c35705b40c5d14bc3d9f"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.4/agentsetup-v1.2.4-linux-amd64"
      sha256 "aee5ff5adfe0115a5d1f16a6b4a535f1956a53172746f6c86e5ea810021beeeb"
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
