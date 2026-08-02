class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.6/agentsetup-v1.3.6-darwin-arm64"
      sha256 "19c3f06ffcdc1aeb466dfa6cae4dc59556dc54c2c24b3149959b09db743dce45"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.6/agentsetup-v1.3.6-darwin-amd64"
      sha256 "ad79bf0a51ffd0d2b247575dc7d33570d6a58554eaa53b2b55d247c7ef523790"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.6/agentsetup-v1.3.6-linux-arm64"
      sha256 "86ba10ee965a7a3b9e49ecb2971d7d39d2724d0f106a1161a0a60a9a187f2a82"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v1.3.6/agentsetup-v1.3.6-linux-amd64"
      sha256 "d0d3ffe4689b76e17759f309b0dcc663951aad25e927e2c51f8538df56e579fd"
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
