class Agentops < Formula
  desc "Service inventory, health, deployment, rollback, and backup operations"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.7.0/agentops-v3.7.0-darwin-arm64"
      sha256 "2fe9871a23a0af5339bfbd09790aff804a1602e2f487eaf2bf6d278133b6335c"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.7.0/agentops-v3.7.0-darwin-amd64"
      sha256 "8ba8e2477593838d6660606c1c4d9e8f8dfc0c32686ddc2a7b4f7f5306ecb786"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.7.0/agentops-v3.7.0-linux-arm64"
      sha256 "af29de847e3a016995824cb270fef09c1fec88ed8cd5d06ef1d8f0e63ab95978"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v3.7.0/agentops-v3.7.0-linux-amd64"
      sha256 "0d1410ca3819c86a9854bc796265fc620ff9453acf0c5e38d992554bfb852cfd"
    end
  end

  def install
    bin.install Dir["agentops-*"].first => "agentops"
    chmod 0755, bin/"agentops"

  end

  test do
    assert_match "Usage: agentops", shell_output("#{bin}/agentops --help")
  end
end
