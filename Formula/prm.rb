class Prm < Formula
  desc "Terminal-first project repository manager"
  homepage "https://github.com/bencetotht/prm"
  version "1.0.7"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bencetotht/prm/releases/download/v1.0.7/prm-v1.0.7-aarch64-apple-darwin.tar.gz"
      sha256 "35fc9039f74da39d9684c74835623a5880f2ceb30369672a0768f6e08c107f08"
    else
      odie "prm: unsupported macOS CPU architecture #{Hardware::CPU.arch}"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bencetotht/prm/releases/download/v1.0.7/prm-v1.0.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d8c78fe7270c728220d465664400909e40b9eddcf81a14a51613864e0ae110f"
    else
      odie "prm: unsupported Linux CPU architecture #{Hardware::CPU.arch}"
    end
  end

  def install
    bin.install Dir["**/prm"].fetch(0)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prm --version")
  end
end
