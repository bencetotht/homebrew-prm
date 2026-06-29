class Prm < Formula
  desc "Terminal-first project repository manager"
  homepage "https://github.com/bencetotht/prm"
  version "1.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bencetotht/prm/releases/download/v1.1.0/prm-v1.1.0-macos-arm64.tar.gz"
      sha256 "d4103795f5989d01247d6d1df86d99212c391b1d2d7a983302c7790b71febb0b"
    else
      odie "prm: unsupported macOS CPU architecture #{Hardware::CPU.arch}"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bencetotht/prm/releases/download/v1.1.0/prm-v1.1.0-linux-x86_64.tar.gz"
      sha256 "df0c8c23bfbf01a07809137098eafbaf75ba42a749a9c71f25b88be1888a5e42"
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
