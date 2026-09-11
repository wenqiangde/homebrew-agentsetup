class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.5.0/agentsetup-v3.5.0-darwin-arm64"
      sha256 "73b129af9e55388ceaec49f62312390d0e8f6e2ba979c586c5d4cfa538ad79c2"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.5.0/agentsetup-v3.5.0-darwin-amd64"
      sha256 "99b1236fe3e7cdcdfc8d3c05d9a4b71a3c15b3fc537237ca3d49655cbf3999b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.5.0/agentsetup-v3.5.0-linux-arm64"
      sha256 "804707d4acca72b3e5a6c833203fde1f1df1fa96a437942a6fbc08e287dc76ed"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.5.0/agentsetup-v3.5.0-linux-amd64"
      sha256 "5b0aeccbca8a898d9fa80a0611ef981baca6cc01a48521660532470ea13bdd04"
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
