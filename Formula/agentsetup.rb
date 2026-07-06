class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.8/agentsetup-v1.2.8-darwin-arm64"
      sha256 "6d9f41f84f68a81d632f07c8c50af7fe9b89c8cccab157de08e59fd7af4ee6b6"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.8/agentsetup-v1.2.8-darwin-amd64"
      sha256 "143eb164327e8ca588a37fdac59841994488ff2aa4ec3c40e170a4622c3e60bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.8/agentsetup-v1.2.8-linux-arm64"
      sha256 "243fcbb2c7603a4dcd3dea219e4f6f7de72ba298cb7e60c39572f5d60f231508"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.2.8/agentsetup-v1.2.8-linux-amd64"
      sha256 "89d5236b2d14fe6f0ac9829fb3ca86adb3f0f906c92b78bc885cd89bbe96be55"
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
