class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  version "1.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.1.1/agentsetup-v1.1.1-darwin-arm64"
      sha256 "6530ff5bfb0e3983cc94c93889fabcd9e10cd92d392fc9f133800cba1e1c95c4"
    else
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.1.1/agentsetup-v1.1.1-darwin-amd64"
      sha256 "e07ef5c282298daa47af8bcf6e880326b520d1fd8e819d02d4ed4689db96b2db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.1.1/agentsetup-v1.1.1-linux-arm64"
      sha256 "14ef7a34aae3dd1dada0efb021ea4cea1456ec94968578370d4366b696fd3184"
    else
      url "https://github.com/wenqiangde/agentsetup/releases/download/v1.1.1/agentsetup-v1.1.1-linux-amd64"
      sha256 "b95f91084b3e234840aaa98d115a9f11b278e5e16358f395f2713f0d80313d0c"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
  end
end
