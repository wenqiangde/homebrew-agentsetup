class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.18/agentsetup-v1.3.18-darwin-arm64"
      sha256 "bff780a47e3fd010d68fea22a04dafca244bf9b6fdfd549b53c9470f7e305074"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.18/agentsetup-v1.3.18-darwin-amd64"
      sha256 "c51a7009150eb23be351e89f4416b09d1b933b7ef858903a0d79e9363d067b74"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.18/agentsetup-v1.3.18-linux-arm64"
      sha256 "ccf86d52495799715f9a3b7da702842c247bcd2a4f60daf655016eaaead1dcfe"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.18/agentsetup-v1.3.18-linux-amd64"
      sha256 "efdc6c3eedfec3ed8fe2a0fda5a8bb94b216ae62bfe2313a891613d355070856"
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
