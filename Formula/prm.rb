class Prm < Formula
  desc "Terminal-first project repository manager"
  homepage "https://github.com/bencetotht/prm"
  version "1.0.8"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bencetotht/prm/releases/download/v1.0.8/prm-v1.0.8-macos-arm64.tar.gz"
      sha256 "da417abbe778185bd020c50421ef62f6ed6538deb8ee37284eca90a46507b59b"
    else
      odie "prm: unsupported macOS CPU architecture #{Hardware::CPU.arch}"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bencetotht/prm/releases/download/v1.0.8/prm-v1.0.8-linux-x86_64.tar.gz"
      sha256 "1287258e51af8324df843da69ebf4e06342e86df8ae2e62285ffeb3641b07abb"
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
