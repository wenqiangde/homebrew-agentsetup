class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.15/agentsetup-v1.3.15-darwin-arm64"
      sha256 "05898ec8153156f1ed96fc5825650894ddc63b990a05194362a639065444df5c"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.15/agentsetup-v1.3.15-darwin-amd64"
      sha256 "ac258c0a50e5b9522f5c1cdeaf389e1eb3ba3b433f3c2a7718722718f8cfdb40"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.15/agentsetup-v1.3.15-linux-arm64"
      sha256 "5cd06372b53bb26456b099e911631fccc308af21cd0387a31dad5d034361ad5c"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.15/agentsetup-v1.3.15-linux-amd64"
      sha256 "7848008496e5a5d531077c8ff60dec570d9584746e6fe53db21fefaced39cd07"
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
